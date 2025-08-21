import 'package:{{app_name.snakeCase()}}/app/ui/app.dart';
import 'package:{{app_name.snakeCase()}}/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() {
    return const MainApp();
  });
}
