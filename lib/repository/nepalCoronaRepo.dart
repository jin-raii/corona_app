import 'dart:convert';

import 'package:corona_test_app/model/nepalCoronaModel.dart';
import 'package:http/http.dart' as http;

class NepalCoronaRepo {
  static final String url =
      'https://data.nepalcorona.info/api/v1/covid/summary';

  Future<CoronaSummary> fetchUrl() async {
    final response = await http.get(url);
    if (response.statusCode != 200) throw Exception();

    try {
      final parsedData = jsonDecode(response.body);
      CoronaSummary data = CoronaSummary.fromJson(parsedData);
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
