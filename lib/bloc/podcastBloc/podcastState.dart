import 'package:corona_test_app/model/podcastModel.dart';
import 'package:equatable/equatable.dart';

abstract class PodcastState extends Equatable{}

class ProdcastInitState extends PodcastState{
  @override
  List<Object> get props => [];
}

class ProdcastLoadingState extends PodcastState{
  @override
  List<Object> get props => [];
}

class ProdcastLoadedState extends PodcastState{
  final PodcastModel podcastModel;
  
  ProdcastLoadedState({this.podcastModel});
  @override
  List<Object> get props => [podcastModel];
}

class ProdcastErrorState extends PodcastState{
  final String errorMessage;
  ProdcastErrorState({this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}