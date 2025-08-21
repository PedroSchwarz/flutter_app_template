import 'package:flutter/widgets.dart';
import 'package:{{app_name.snakeCase()}}/app/dependencies/locator.dart';

Future<void> bootstrap(Widget Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  await MainLocator().setup();

  runApp(builder());
}
