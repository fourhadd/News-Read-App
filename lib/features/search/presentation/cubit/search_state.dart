// features/search/presentation/cubit/search_state.dart
import 'package:equatable/equatable.dart';
import 'package:news_feed/features/news/domain/entities/article_entity.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

// 1. İlkin vəziyyət (Ekran ilk açılanda və ya axtarış silinəndə)
class SearchInitial extends SearchState {}

// 2. Yüklənmə vəziyyəti (API-ya sorğu göndəriləndə)
class SearchLoading extends SearchState {}

// 3. Uğurlu nəticə vəziyyəti (Məlumatlar gələndə)
class SearchSuccess extends SearchState {
  final List<ArticleEntity> articles;

  const SearchSuccess(this.articles);

  @override
  List<Object?> get props => [articles];
}

// 4. Xəta vəziyyəti (İnternet kəsiləndə və ya server problemi olanda)
class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object?> get props => [message];
}
