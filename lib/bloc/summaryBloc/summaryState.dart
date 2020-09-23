import 'package:corona_test_app/model/nepalCoronaModel.dart';
import 'package:equatable/equatable.dart';

abstract class SummaryState extends Equatable {}

class SummaryInitState extends SummaryState {
  @override
  List<Object> get props => [];
}

class SummaryLoadingState extends SummaryState {
  @override
  List<Object> get props => [];
}

class SummaryLoadedState extends SummaryState {
  final CoronaSummary coronaSummary;
  SummaryLoadedState({this.coronaSummary});
  @override
  List<Object> get props => [];
}

class SummaryErrorState extends SummaryState {
  final String error;
  SummaryErrorState({this.error});
  @override
  List<Object> get props => [];
}
