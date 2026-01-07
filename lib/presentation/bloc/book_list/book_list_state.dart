import 'package:equatable/equatable.dart';
import 'package:take_home/data/models/book_model.dart';

abstract class BookListState extends Equatable {
  const BookListState();

  @override
  List<Object?> get props => [];
}

class BookListLoading extends BookListState {}

class BookListSuccess extends BookListState {
  final List<BookModel> books;
  final bool isLoadingMore;
  const BookListSuccess(this.books, {this.isLoadingMore = false});

  @override
  List<Object?> get props => [books];
}

class BookListEmpty extends BookListState {}

class BookListError extends BookListState {
  final String message;
  const BookListError(this.message);

  @override
  List<Object?> get props => [message];
}
