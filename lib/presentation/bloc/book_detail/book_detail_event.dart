import 'package:take_home/data/models/book_model.dart';

abstract class BookDetailEvent {}

class LoadBookDetail extends BookDetailEvent {
  final BookModel book;
  LoadBookDetail(this.book);
}

class ToggleFavorite extends BookDetailEvent {
  final BookModel book;
  ToggleFavorite(this.book);
}

class ToggleRead extends BookDetailEvent {
  final BookModel book;
  ToggleRead(this.book);
}
