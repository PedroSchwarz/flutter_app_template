import 'package:freezed_annotation/freezed_annotation.dart';

part 'build_configuration.freezed.dart';

enum Environment { development, staging, production }

@freezed
abstract class BuildConfiguration with _$BuildConfiguration {
  const factory BuildConfiguration({required Environment environment}) = _BuildConfiguration;
}
