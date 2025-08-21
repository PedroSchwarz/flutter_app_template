import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_cubit.freezed.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(const DetailsState(isLoading: false, value: 0));

  Future<void> load({required int value}) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(value: value, isLoading: false));
  }

  Future<void> refresh() async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 4));

    emit(state.copyWith(isLoading: false));
  }
}

@freezed
sealed class DetailsState with _$DetailsState {
  const factory DetailsState({required bool isLoading, required int value}) = _DetailsState;
}
