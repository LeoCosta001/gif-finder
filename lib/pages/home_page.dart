import 'package:flutter/material.dart';
import 'package:gif_finder/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Row(
          children: [
            Image.network(
              'https://i.imgur.com/0sPgQkU.gif',
              height: 90,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'Gif Finder',
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
            )
          ],
        ),
      ),
      body: Container(color: backGroundColor),
    );
  }
}
