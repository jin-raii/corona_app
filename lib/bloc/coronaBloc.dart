import 'package:corona_test_app/bloc/coronaEvent.dart';
import 'package:corona_test_app/bloc/coronaState.dart';
import 'package:corona_test_app/model/coronaModel.dart';
import 'package:corona_test_app/repository/coronaRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoronaBloc extends Bloc<CoronaEvent, CoronaState>{
  final CoronaRepository coronaRepository;
  CoronaBloc({CoronaInitState coronaInitState, this.coronaRepository}) : super(coronaInitState);

  @override
  Stream<CoronaState> mapEventToState(CoronaEvent event) async* {
    if (event is CoronaEvent){
      yield CoronaLoadingState();

      try {
        List<CovidModel> result = await coronaRepository.getData();
        yield CoronaLoadedState(coronaData: result);
      } catch(e){
        yield CoronaErrorState(errorMessage: e.toString());
      }
    }
    
  }

}