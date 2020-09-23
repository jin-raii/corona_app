import 'dart:convert';

import 'package:corona_test_app/model/coronaModel.dart';
import 'package:http/http.dart' as http;

class CoronaRepository {
  static final String url = 'https://corona.lmao.ninja/v2/countries';

  Future<List<CovidModel>> getData() async {
    final response = await http.get(url);
    if (response.statusCode != 200) throw Exception();

    try {
      // as List
      final parsedJson = jsonDecode(response.body) as List;
      List<CovidModel> data =
          parsedJson.map((value) => CovidModel.fromJson(value)).toList();
      // for (var dat in data) {
      //   print(dat.cases);
        
      // }
      // List<CovidModel> parsedData = json
      //     .decode(response.body)
      //     .map((Map m) => CovidModel.fromJson(m))
      //     .toList();
      // CovidModel result = CovidModel.fromJson(parsedData);

      return data;
    } catch (e) {
      throw Exception('error $e');
    }
  }
}
