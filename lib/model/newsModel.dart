class NewsModel {
  String name;
  String title;
  String description;
  String url;
  String publishedAt;
  String urlToImage;

  NewsModel(
      {required this.name,
      required this.title,
      required this.description,
      required this.url,
      required this.publishedAt,
      required this.urlToImage});
}
