// features/news/data/models/article_model.dart
import 'package:news_feed/features/news/data/models/source_model.dart';
import 'package:news_feed/features/news/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    required super.id,
    required super.title,
    required super.content,
    super.imageUrl,
    required SourceModel super.source,
    super.author,
    required super.publishedAt,
    required super.category,
    required super.url,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json, String category) {
    final fields = json['fields'] ?? {};
    return ArticleModel(
      id: json['id'] ?? '',
      title: fields['headline'] ?? json['webTitle'] ?? '',
      content: fields['body'] ?? '',
      imageUrl: fields['thumbnail'],

      source: const SourceModel(id: 'the-guardian', name: 'The Guardian'),
      author: fields['byline'],
      publishedAt: DateTime.parse(
        json['webPublicationDate'] ?? DateTime.now().toIso8601String(),
      ),
      category: category,
      url: json['webUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'webTitle': title,
      'webPublicationDate': publishedAt.toIso8601String(),
      'category': category,
      'webUrl': url,
      'source': SourceModel.fromEntity(source).toJson(),
      'fields': {
        'headline': title,
        'body': content,
        'thumbnail': imageUrl,
        'byline': author,
      },
    };
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      imageUrl: entity.imageUrl,
      source: SourceModel.fromEntity(entity.source),
      author: entity.author,
      publishedAt: entity.publishedAt,
      category: entity.category,
      url: entity.url,
    );
  }
}
