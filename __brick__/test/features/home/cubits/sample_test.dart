import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{app_name.snakeCase()}}/features/home/home.dart';

void main() {
  group('HomeCubit', () {
    group('Increment', () {
      blocTest('emits [1] when increment is called', build: HomeCubit.new, act: (cubit) => cubit.increment(), expect: () => [1]);

      blocTest(
        'emits [2] when increment is called',
        build: HomeCubit.new,
        act: (cubit) {
          cubit.increment();
          cubit.increment();
        },
        expect: () => [1, 2],
      );

      blocTest(
        'emits [2] when increment is called',
        build: HomeCubit.new,
        act: (cubit) {
          cubit.increment();
          cubit.increment();
        },
        skip: 1,
        expect: () => [2],
      );

      blocTest('emits [10] when seeded with 9', build: HomeCubit.new, seed: () => 9, act: (cubit) => cubit.increment(), expect: () => [10]);
    });

    group('Decrement', () {
      blocTest(
        'emits [] when increment is called with default value of 0',
        build: HomeCubit.new,
        act: (cubit) => cubit.decrement(),
        expect: () => [],
      );

      blocTest('emits [4] when seeded with 5', build: HomeCubit.new, seed: () => 5, act: (cubit) => cubit.decrement(), expect: () => [4]);
    });
  });
}
