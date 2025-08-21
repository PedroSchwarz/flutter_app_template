import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:{{app_name.snakeCase()}}/app/app.dart';
import 'package:{{app_name.snakeCase()}}/features/home/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = getIt<HomeCubit>();

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: BlocSelector<HomeCubit, int, String>(
          bloc: cubit,
          selector: (state) => state.toString(),
          builder: (context, value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Current Counter Value is: $value'),

                const Gap(AppSpacing.md),
                ElevatedButton(
                  onPressed: () {
                    context.goNamed(DetailsScreen.routeName, queryParameters: {'value': value.toString()});
                  },
                  child: const Text('Navigate to counter details'),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton.filledTonal(onPressed: cubit.increment, icon: const Icon(Icons.add), iconSize: 32),
          const Gap(AppSpacing.md),
          IconButton.filled(onPressed: cubit.decrement, icon: const Icon(Icons.remove), iconSize: 32),
        ],
      ),
    );
  }
}
