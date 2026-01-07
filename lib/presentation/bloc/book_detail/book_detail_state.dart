import 'package:equatable/equatable.dart';
import 'package:take_home/data/models/book_model.dart';

abstract class BookDetailState extends Equatable {
  const BookDetailState();
  @override
  List<Object?> get props => [];
}

class BookDetailInitial extends BookDetailState {}

class BookDetailLoading extends BookDetailState {}

class BookDetailUpdated extends BookDetailState {
  final BookModel book;
  const BookDetailUpdated(this.book);

  @override
  List<Object?> get props => [book];
}

class BookDetailError extends BookDetailState {
  final String message;
  const BookDetailError(this.message);
  @override
  List<Object?> get props => [message];
}
