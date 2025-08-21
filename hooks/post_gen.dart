import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;

  final platforms = (context.vars['platforms'] as List).cast<String>();

  logger.info('⚙️  Adding Flutter platforms: ${platforms.join(", ")}');

  final result = await Process.run(
    'flutter',
    ['create', '--platforms', platforms.join(','), '.'],
    runInShell: true,
  );

  stdout.write(result.stdout);
  stderr.write(result.stderr);

  if (result.exitCode == 0) {
    logger.success('✅ Platforms added successfully!');
  } else {
    logger.err('❌ Failed to add platforms');
  }

  // Then, check if we should run build_runner
  await _runBuildRunner(context, logger);
}

Future<void> _runBuildRunner(HookContext context, Logger logger) async {
  // Check if build_runner should be executed
  final runBuildRunner = context.vars['run_build_runner'] ?? true;

  if (!runBuildRunner) {
    logger.info('Skipping build_runner');
    return;
  }

  // Check if pubspec.yaml has build_runner dependency
  final pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    logger.warn('No pubspec.yaml found, skipping build_runner');
    return;
  }

  final pubspecContent = await pubspecFile.readAsString();
  if (!pubspecContent.contains('build_runner')) {
    logger.info('No build_runner dependency found, skipping code generation');
    return;
  }

  logger.info('📦 Getting dependencies...');
  final pubGetProgress = logger.progress('Running flutter pub get');

  try {
    // First run flutter pub get
    final pubGetResult = await Process.run(
      'flutter',
      ['pub', 'get'],
      runInShell: true,
    );

    if (pubGetResult.exitCode != 0) {
      pubGetProgress.fail('flutter pub get failed');
      logger.err('Failed to get dependencies: ${pubGetResult.stderr}');
      return;
    }
    pubGetProgress.complete('Dependencies resolved');

    // Then run build_runner
    logger.info('🔨 Running code generation...');
    final buildProgress = logger.progress('Running build_runner build');

    final buildResult = await Process.run(
      'dart',
      ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
      runInShell: true,
    );

    if (buildResult.exitCode == 0) {
      buildProgress.complete('Code generation completed');
      logger.success('✅ build_runner completed successfully');
    } else {
      buildProgress.fail('build_runner failed');
      logger.err('❌ build_runner failed: ${buildResult.stderr}');
    }
  } catch (e) {
    logger.err('Error running build_runner: $e');
  }
}
