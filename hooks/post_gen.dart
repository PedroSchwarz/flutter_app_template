import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;

  final platforms = (context.vars['platforms'] as String).split(',');

  logger.info('⚙️  Adding Flutter platforms: ${platforms.join(", ")}');

  final result = await Process.run('flutter', ['create', '--platforms', platforms.join(','), '.'], runInShell: true);

  stdout.write(result.stdout);
  stderr.write(result.stderr);

  if (result.exitCode == 0) {
    logger.success('✅ Platforms added successfully!');
  } else {
    logger.err('❌ Failed to add platforms');
  }
}
