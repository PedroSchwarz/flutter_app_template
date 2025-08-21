import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{app_name.snakeCase()}}/app/app.dart';
import 'package:{{app_name.snakeCase()}}/features/home/ui/cubits/details_cubit.dart';

class DetailsScreen extends StatefulWidget {
  final int value;

  const DetailsScreen({required this.value, super.key});

  static const routeName = 'details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final cubit = getIt<DetailsCubit>();

  @override
  void initState() {
    super.initState();
    cubit.load(value: widget.value);
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<DetailsCubit, DetailsState>(
            bloc: cubit,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.isLoading) const LinearProgressIndicator(),
                  const Spacer(),
                  AppSkeleton(isLoading: state.isLoading, child: Text('The current value is ${state.value.toString()}')),
                  const Spacer(),
                  ElevatedButton(onPressed: cubit.refresh, child: const Text('Refresh counter')),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
