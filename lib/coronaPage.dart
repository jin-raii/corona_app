import 'package:corona_test_app/bloc/coronaBloc.dart';
import 'package:corona_test_app/bloc/coronaEvent.dart';
import 'package:corona_test_app/bloc/coronaState.dart';

import 'package:corona_test_app/model/coronaModel.dart';

import 'package:corona_test_app/widget/podcast/podcastPage.dart';
import 'package:corona_test_app/widget/summary/summaryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoronaPage extends StatefulWidget {
  @override
  _CoronaPageState createState() => _CoronaPageState();
}

class _CoronaPageState extends State<CoronaPage> {
  CoronaBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CoronaBloc>(context);
    bloc.add(CoronaEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 20),
        color: Colors.black,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocListener<CoronaBloc, CoronaState>(
                  listener: (context, state) {
                    if (state is CoronaErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                          state.errorMessage,
                          style: TextStyle(color: Colors.red),
                        )),
                      );
                    }
                  },
                  child: Container(
                    child: BlocConsumer<CoronaBloc, CoronaState>(
                        listener: (context, state) {
                      if (state is CoronaLoadedState) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Hello there'),
                        ));
                      }
                    }, builder: (context, state) {
                      if (state is CoronaLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CoronaInitState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CoronaLoadedState) {
                        print('state.coronaData');
                        return buildWidget(state.coronaData);
                      } else if (state is CoronaErrorState) {
                        return Text(state.errorMessage);
                      } else {
                        return Container(
                            child: Text('Container',
                                style: TextStyle(color: Colors.red)));
                      }
                    }),
                  ),
                ),
               
                Container(
                  child: SummaryPage(),
                ),
              ],
            ),
          ],
        ));
  }

  Widget buildWidget(List<CovidModel> covidModel) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Card(
          child: Column(
        children: [
          Text(covidModel[140].country,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Container(
              child: Image.network(
            covidModel[140].countryInfo.flag,
            width: 100,
            height: 50,
          )),
          Text(covidModel[140].active.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      )),
    );
  }
}
