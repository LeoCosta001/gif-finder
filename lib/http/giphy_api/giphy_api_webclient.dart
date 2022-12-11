import 'dart:convert';

import 'package:gif_finder/auth/secret.dart';
import 'package:gif_finder/models/giphy_api_model.dart';
import 'package:http/http.dart';

final Client client = Client();

class GiphyApi {
  Future<Map> getSearchGifs(GetSearchGifsOptions options) async {
    // Check query
    if (options.query.isEmpty) {
      return await getTrendsGifs(GetTrendsGifsOptions());
    } else {
      const int pageLimit = 21;
      final int pageNumber = ((options.pageNumber ?? 1) - 1) * pageLimit;
      final String selectedLang = options.lang ?? 'en';

      final Response response = await client.get(
        Uri.parse(
            'https://api.giphy.com/v1/gifs/search?api_key=$giphyApiKey&q=${options.query}&limit=$pageLimit&offset=$pageNumber&rating=g&lang=$selectedLang'),
      );

      return json.decode(response.body);
    }
  }

  Future<Map> getTrendsGifs(GetTrendsGifsOptions options) async {
    final int pageLimit = (options.pageNumber ?? 1) * 20;
    final Response response = await client.get(
      Uri.parse('https://api.giphy.com/v1/gifs/trending?api_key=$giphyApiKey&limit=$pageLimit&rating=g'),
    );

    return json.decode(response.body);
  }
}
