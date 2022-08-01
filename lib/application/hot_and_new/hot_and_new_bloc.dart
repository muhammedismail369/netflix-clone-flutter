import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new_resp/hot_and_new_service.dart';

import '../../domain/hot_and_new_resp/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    // Get Hot and New movie data
    on<LoadDataInComingSoon>((event, emit) async {
      //Send loading to UI
      emit(
        const HotAndNewState(
          ComingSoonList: [],
          EveryOneIsWatchingList: [],
          isLoading: true,
          hasError: false,
        ),
      );
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();

      //Data to state
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
            ComingSoonList: [],
            EveryOneIsWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            ComingSoonList: resp.results,
            EveryOneIsWatchingList: state.EveryOneIsWatchingList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(newState);
    });

    // Get Hot and New TV data
    on<LoadDataInEveryoneIsWatching>((event, emit) {});
  }
}
