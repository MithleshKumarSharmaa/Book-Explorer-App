import 'package:equatable/equatable.dart';
import 'package:take_home/data/models/book_model.dart';

abstract class FavoriteBookState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteBookInitial extends FavoriteBookState {}

class FavoriteBookLoading extends FavoriteBookState {}

class FavoriteBookSuccess extends FavoriteBookState {
  final List<BookModel> books;

  FavoriteBookSuccess(this.books);

  @override
  List<Object?> get props => [books];
}

class FavoriteBooksEmpty extends FavoriteBookState {}

class FavoriteBookError extends FavoriteBookState {
  final String message;

  FavoriteBookError(this.message);

  @override
  List<Object?> get props => [message];
}
