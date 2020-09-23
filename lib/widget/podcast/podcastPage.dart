import 'package:corona_test_app/bloc/podcastBloc/podcastBloc.dart';
import 'package:corona_test_app/bloc/podcastBloc/podcastEvent.dart';
import 'package:corona_test_app/bloc/podcastBloc/podcastState.dart';
import 'package:corona_test_app/model/podcastModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PodcastPage extends StatefulWidget {
  @override
  _PodcastPageState createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  ProdcastBloc prodcastBloc;
  @override
  void initState() {
    super.initState();
    prodcastBloc = BlocProvider.of<ProdcastBloc>(context);
    prodcastBloc.add(PodcastEvent());
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: BlocListener(
          cubit: prodcastBloc,
          listener: (context, state) {
            if (state is ProdcastErrorState) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          child: BlocConsumer<ProdcastBloc, PodcastState>(
            listener: (context, state){
              if (state is ProdcastErrorState) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
            },
              builder: (context, state) {
            if (state is ProdcastInitState) {
              return Center(child: CircularProgressIndicator(backgroundColor: Colors.white,));
            } else if (state is ProdcastLoadingState) {
              return Center(child: CircularProgressIndicator(backgroundColor: Colors.yellow,), );
            } else if (state is ProdcastLoadedState) {
              return buildProdcast(state.podcastModel);
            } else if (state is ProdcastErrorState) {
              return Text(state.errorMessage);
            } else {
              return Container();
            }
          }),
        ),
    
    );
  }

  Widget buildProdcast(PodcastModel podcastModel) {
    return Container(
     
      child: Column(
        children: [
          Card(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                Container(
                  
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(child: Text(podcastModel.data[1].title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                ),

                Container(
                  child: Image.network(podcastModel.data[1].imageUrl),
                  // child: Text(podcastModel.data[1].imageUrl)
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(podcastModel.data[1].summary, style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
