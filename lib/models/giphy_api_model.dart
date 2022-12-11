class GetSearchGifsOptions {
  GetSearchGifsOptions({
    required this.query,
    this.pageNumber,
    this.lang,
  });

  String query;
  int? pageNumber;
  String? lang;
}

class GetTrendsGifsOptions {
  GetTrendsGifsOptions({this.pageNumber});
  int? pageNumber;
}
