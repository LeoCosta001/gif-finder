import 'dart:convert';

import 'package:gif_finder/auth/secret.dart';
import 'package:gif_finder/models/giphy_api_model.dart';
import 'package:http/http.dart';

final Client client = Client();

class GiphyApi {
  Future<Map> getTrendsGifs(GetTrendsGifsOptions options) async {
    final int pageLimit = (options.pageNumber ?? 1) * 20;
    final Response response = await client.get(
      Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=$giphyApiKey&limit=$pageLimit&rating=g'),
    );

    return json.decode(response.body);
  }
}
