import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoonapp/models/webtoon_model.dart';

import '../models/webtoon_detail_model.dart';
import '../models/webtoon_episode_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtooninstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);

        webtooninstances.add(instance);
      }

      return webtooninstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);

      return WebtoonDetailModel.fromJSON(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getToonLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJSON(episode));
      }
      print(episodesInstances[1].title);
      return episodesInstances;
    }
    throw Error();
  }
}
