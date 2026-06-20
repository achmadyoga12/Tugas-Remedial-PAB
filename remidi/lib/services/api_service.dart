import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class ApiService {
  static Future<List<ArticleModel>> getArticles() async {
    final response = await http.get(
      Uri.parse('https://api.spaceflightnewsapi.net/v4/articles/?limit=20'),
    );

    final data = jsonDecode(response.body);

    return (data['results'] as List)
        .map((e) => ArticleModel.fromJson(e))
        .toList();
  }
}
