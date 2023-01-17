class WebtoonEpisodeModel {
  final String title, id, rating, date;

  WebtoonEpisodeModel.fromJSON(Map<String, dynamic> json)
      : title = json['title'],
        date = json['date'],
        rating = json['rating'],
        id = json['id'];
}
