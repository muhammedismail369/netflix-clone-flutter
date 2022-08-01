part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HotAndNewData> ComingSoonList,
    required List<HotAndNewData> EveryOneIsWatchingList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(
        ComingSoonList: [],
        EveryOneIsWatchingList: [],
        isLoading: false,
        hasError: false,
      );
}
