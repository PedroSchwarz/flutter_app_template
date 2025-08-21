import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{app_name.snakeCase()}}/features/home/home.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter() {
  final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/${HomeScreen.routeName}',
    routes: [
      GoRoute(
        path: '/${HomeScreen.routeName}',
        name: HomeScreen.routeName,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: '/${DetailsScreen.routeName}',
            name: DetailsScreen.routeName,
            builder: (context, state) {
              final value = int.tryParse(state.uri.queryParameters['value'] ?? '') ?? 0;
              return DetailsScreen(value: value);
            },
          ),
        ],
      ),
    ],
  );
  return router;
}
