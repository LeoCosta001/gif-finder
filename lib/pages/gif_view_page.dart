import 'package:flutter/material.dart';
import 'package:gif_finder/main.dart';

class GifViewPage extends StatelessWidget {
  const GifViewPage({Key? key, required this.gifData}) : super(key: key);

  final Map gifData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          '${gifData['title']}',
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      backgroundColor: backGroundColor,
      body: Center(
        child: Image.network(gifData['images']['fixed_height']['url']),
      ),
    );
  }
}
