import 'package:flutter/material.dart';
import 'package:gif_finder/pages/home_page.dart';

const mainColor = Color(0xFFF0A459);
const backGroundColor = Color(0xFF243447);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gif Finder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: mainColor,
        ),
        iconTheme: const IconThemeData(color: mainColor),
        textTheme: const TextTheme(
          button: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: mainColor, fontSize: 20),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: mainColor.withOpacity(0.3)),
          ),
          prefixStyle: TextStyle(color: mainColor.withOpacity(0.8), fontSize: 20),
          labelStyle: TextStyle(color: mainColor.withOpacity(0.8), fontSize: 20),
        ),
      ),
      home: const HomePage(),
    );
  }
}
