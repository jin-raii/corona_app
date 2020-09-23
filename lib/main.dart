import 'package:corona_test_app/bloc/coronaBloc.dart';
import 'package:corona_test_app/bloc/podcastBloc/podcastBloc.dart';
import 'package:corona_test_app/bloc/summaryBloc/summaryBloc.dart';
import 'package:corona_test_app/coronaPage.dart';
import 'package:corona_test_app/repository/coronaRepository.dart';
import 'package:corona_test_app/repository/nepalCoronaRepo.dart';
import 'package:corona_test_app/repository/podcastRepo.dart';
import 'package:corona_test_app/screens/bottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CoronaBloc>(
        create: (context) => CoronaBloc(coronaRepository: CoronaRepository()),
          ),
          BlocProvider<ProdcastBloc>(create: (context) => ProdcastBloc(podcastRepo: PodcastRepo()),),
          // Summary Bloc 
          BlocProvider<SummaryBloc>(create: (context) => SummaryBloc(nepalCoronaRepo: NepalCoronaRepo()),),
        ], 
        child: CoronaPage(),
        
        )
      );
    
  }
}