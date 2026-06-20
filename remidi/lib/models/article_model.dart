class ArticleModel {
  final int id;
  final String title;
  final String imageUrl;
  final String summary;
  final String newsSite;

  ArticleModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.summary,
    required this.newsSite,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      title: json['title'] ?? '',
      imageUrl: json['image_url'] ?? '',
      summary: json['summary'] ?? '',
      newsSite: json['news_site'] ?? '',
    );
  }
}
