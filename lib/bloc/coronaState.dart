import 'package:corona_test_app/model/coronaModel.dart';
import 'package:equatable/equatable.dart';

abstract class CoronaState extends Equatable {}

class CoronaInitState extends CoronaState {
  @override
  List<Object> get props => [];
}

class CoronaLoadingState extends CoronaState {
  @override
  List<Object> get props => [];
}

class CoronaLoadedState extends CoronaState {
  final List<CovidModel> coronaData;
  CoronaLoadedState({this.coronaData});
  @override
  List<Object> get props => [coronaData];
}

class CoronaErrorState extends CoronaState {
  final String errorMessage;
  CoronaErrorState({this.errorMessage});
  @override
  List<Object> get props => [];
}
