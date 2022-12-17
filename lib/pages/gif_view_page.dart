import 'package:flutter/material.dart';
import 'package:gif_finder/main.dart';
import 'package:share/share.dart';

class GifViewPage extends StatelessWidget {
  const GifViewPage({Key? key, required this.gifData}) : super(key: key);

  final Map gifData;

  @override
  Widget build(BuildContext context) {
    late String gifTitle = gifData['title'];
    late String gifUrl = gifData['images']['fixed_height']['url'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          gifTitle,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Share.share('$gifTitle $gifUrl from Gif Finder App');
            },
            icon: const Icon(Icons.share),
          )
        ],
      ),
      backgroundColor: backGroundColor,
      body: Center(
        child: Image.network(gifUrl),
      ),
    );
  }
}
