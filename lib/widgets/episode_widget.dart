import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:webtoonapp/models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  const Episode({Key? key, required this.episode, required this.webtoonId})
      : super(key: key);

  onButtonTap() async {
    if (await canLaunchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=805156&no=1")) {
      await launchUrlString(
          "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
    } else {
      throw "cannot";
    }
  }

  final String webtoonId;
  final WebtoonEpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.green.shade300,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(5, 5),
                color: Colors.black.withOpacity(0.1),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  episode.title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: 1,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
