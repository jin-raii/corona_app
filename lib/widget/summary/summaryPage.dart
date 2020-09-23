
import 'package:corona_test_app/bloc/summaryBloc/summaryBloc.dart';
import 'package:corona_test_app/bloc/summaryBloc/summaryEvent.dart';
import 'package:corona_test_app/bloc/summaryBloc/summaryState.dart';
import 'package:corona_test_app/model/nepalCoronaModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  SummaryBloc summaryBloc;
  @override
  void initState() {
    super.initState();
    summaryBloc = BlocProvider.of<SummaryBloc>(context);
    summaryBloc.add(SummaryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: BlocListener(
          cubit: summaryBloc,
          listener: (context, state) {
            if (state is SummaryErrorState) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocConsumer<SummaryBloc, SummaryState>(
              listener: (context, state){
                if(state is SummaryErrorState){
                  Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
            if (state is SummaryInitState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SummaryLoadingState ){
              return Center(child: CircularProgressIndicator());
            } else if (state is SummaryLoadedState ){
              return buildProdcast(state.coronaSummary);
            } else if (state is SummaryErrorState) {
              return Text(state.error);
            } else {
              return Container();
            }
          }),
        ),
    
    );
  }

  Widget buildProdcast(CoronaSummary coronaSummary) {
    return Container(
      child: Text(coronaSummary.currentState[0].count.toString(), style: TextStyle(color: Colors.white)),
    );
  }
}
