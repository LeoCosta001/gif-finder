import 'package:flutter/material.dart';
import 'package:gif_finder/http/giphy_api/giphy_api_webclient.dart';
import 'package:gif_finder/main.dart';
import 'package:gif_finder/models/giphy_api_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // API instance
  final GiphyApi _giphyApi = GiphyApi();

  // States
  String _search = '';

  // Methods
  Future<Map> _getGifs() async {
    if (_search.isEmpty) {
      return _giphyApi.getTrendsGifs(GetTrendsGifsOptions());
    } else {
      return _giphyApi.getSearchGifs(GetSearchGifsOptions(query: _search));
    }
  }

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
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                setState(() {
                  _search = value;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              builder: ((context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.topCenter,
                      child: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(mainColor)),
                    );

                  default:
                    if (snapshot.hasError) {
                      return Container(
                        alignment: Alignment.topCenter,
                        child: const Text('Error!'),
                      );
                    } else {
                      return _createGifList(context, snapshot);
                    }
                }
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createGifList(BuildContext context, AsyncSnapshot snapshot) {
    final int gifQuantity = snapshot.data['data'].length;

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: gifQuantity,
      itemBuilder: ((context, index) {
        return GestureDetector(
          child: Image.network(
            snapshot.data['data'][index]['images']['fixed_height']['url'],
            height: 300,
            fit: BoxFit.cover,
          ),
        );
      }),
    );
  }
}
