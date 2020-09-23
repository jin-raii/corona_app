import 'package:bloc/bloc.dart';
import 'package:corona_test_app/bloc/podcastBloc/podcastEvent.dart';
import 'package:corona_test_app/bloc/podcastBloc/podcastState.dart';
import 'package:corona_test_app/model/podcastModel.dart';
import 'package:corona_test_app/repository/podcastRepo.dart';

class ProdcastBloc extends Bloc<PodcastEvent, PodcastState> {
  PodcastRepo podcastRepo;
  ProdcastBloc({ProdcastInitState initialState, this.podcastRepo}) : super(initialState);

  @override
  Stream<PodcastState> mapEventToState(PodcastEvent event) async* {
    if (event is PodcastEvent) {
      yield ProdcastLoadingState();

      try {
        PodcastModel podcastData = await podcastRepo.getData();
        yield ProdcastLoadedState(podcastModel: podcastData);
      } catch (e) {
        yield ProdcastErrorState(errorMessage: e.toString());
      }
    }
  }
}
