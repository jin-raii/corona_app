import 'package:corona_test_app/bloc/summaryBloc/summaryEvent.dart';
import 'package:corona_test_app/bloc/summaryBloc/summaryState.dart';
import 'package:corona_test_app/model/nepalCoronaModel.dart';
import 'package:corona_test_app/repository/nepalCoronaRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  NepalCoronaRepo nepalCoronaRepo;
  
  SummaryBloc({SummaryInitState initialState, this.nepalCoronaRepo}) : super(initialState);

  @override
  Stream<SummaryState> mapEventToState(SummaryEvent event) async* {
    if (event is SummaryEvent) {
      yield SummaryLoadingState();
      try {
        CoronaSummary coronaSummary = await nepalCoronaRepo.fetchUrl();
        yield SummaryLoadedState(coronaSummary: coronaSummary);
      } catch (e) {
        yield SummaryErrorState(error: e.toString());
      }
    }
  }
}
