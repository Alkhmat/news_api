import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api/model.dart';

class ApiRepository {
  Future<List<ApiModel>> getApi() async {
    const url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=736a79e3e96e4d71aba9334461f0d418';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List articles = json['articles'];
      final result = articles.map((e) {
        return ApiModel(
          sourceName: e['source']['name'] ?? 'Unknown Source',
          author: e['author'] ?? 'Unknown Author',
          title: e['title'] ?? 'No Title',
          description: e['description'] ?? 'No Description',
          url: e['url'] ?? '',
          urlToImage: e['urlToImage'] ?? '',
          publishedAt: e['publishedAt'] ?? 'Unknown Date',
          content: e['content'] ?? 'No Content',
        );
      }).toList();
      return result;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
