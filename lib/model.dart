class ApiModel {
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ApiModel({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sourceName': sourceName,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory ApiModel.fromMap(Map<String, dynamic> map) {
    return ApiModel(
      sourceName: map['sourceName'] as String,
      author: map['author'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String,
      publishedAt: map['publishedAt'] as String,
      content: map['content'] as String,
    );
  }
}
