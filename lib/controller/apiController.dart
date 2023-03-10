import 'dart:convert';

import '../model/newsModel.dart';
import 'package:http/http.dart' as http;

class ApiController {
  static Future<List<NewsModel>> fetchArticles() async {
    List<NewsModel> newsmodel = [];
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=eg&apiKey=4c807d8cb803440eaab02000fc96688d");
    print("Url ===> $url");
    var response = await http.get(url);
    print("response ===> $response");
    var responseBody = jsonDecode(response.body)["articles"];
    print("responsebody ===> $responseBody");
    for (var i in responseBody) {
      newsmodel.add(NewsModel(
          name: i["source"]["name"],
          title: i["title"],
          description: i["description"],
          url: i["url"],
          publishedAt: i["publishedAt"],
          urlToImage: i["urlToImage"]));
    }
    return newsmodel;
  }

  static Future<List<NewsModel>> fetchArticlesCategory(String category) async {
    List<NewsModel> newsmodel = [];
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=4c807d8cb803440eaab02000fc96688d");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body)["articles"];
    for (var i in responseBody) {
      newsmodel.add(NewsModel(
          name: i["source"]['name'],
          title: i["title"],
          description: i["description"],
          url: i["url"],
          publishedAt: i["publishedAt"],
          urlToImage: i["urlToImage"]));
    }
    return newsmodel;
  }
}
