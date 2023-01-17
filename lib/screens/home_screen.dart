import 'package:flutter/material.dart';
import 'package:webtoonapp/models/webtoon_model.dart';
import 'package:webtoonapp/services/api_services.dart';

import '../widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          "Todays webtoons",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
          ),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          print(index);
          var webtoon = snapshot.data![index];

          return WebToon(
              title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
        }),
        separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
        itemCount: snapshot.data!.length);
  }
}
