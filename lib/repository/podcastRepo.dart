import 'dart:convert';

import 'package:corona_test_app/model/podcastModel.dart';
import 'package:http/http.dart' as http;

class PodcastRepo {
  static final String url = 'https://nepalcorona.info/api/v1/podcasts';

  Future<PodcastModel> getData() async {
    final response = await http.get(url);
    if (response.statusCode != 200) throw Exception();

    try {
      // as List
      final parsedJson = jsonDecode(response.body);

      // List<PodcastModel> data = PodcastModel.fromJson(parsedJson)as List;
      // List<PodcastModel> data =
      //     parsedJson.map((value) => PodcastModel.fromJson(value));

      // for (var data in parsedJson) {
      //   print(data.data[0].title);
      //   print('data');
      // }

      // print('result');

      // List<PodcastModel> parsedData = json
      //     .decode(response.body)
      //     .map((Map m) => PodcastModel.fromJson(m))
      //     .toList();

      return PodcastModel.fromJson(parsedJson);
    } catch (e) {
      throw Exception('error $e');
    }
  }
}
