import 'package:take_home/data/data_sources/book_local_data_source.dart';
import 'package:take_home/data/data_sources/book_remote_data_source.dart';
import 'package:take_home/data/local_models/book_local_model.dart';
import 'package:take_home/data/models/book_model.dart';

class BookRepository {
  final BookRemoteDataSource remote;
  final BookLocalDataSource local;

  BookRepository(this.remote, this.local);

  Future<List<BookModel>> getBooks() async {
    final remoteBooks = await remote.fetchBooks();

    return remoteBooks.map((book) {
      final localBook = local.getBook(book.id);
      if (localBook != null) {
        return book.copyWith(
          isFavorite: localBook.isFavorite,
          isRead: localBook.isRead,
        );
      }
      return book;
    }).toList();
  }

  Future<BookModel> toggleFavorite(BookModel book) async {
    final updatedBook = book.copyWith(isFavorite: !book.isFavorite);
    await local.saveBook(
      BookLocalModel(
        id: updatedBook.id,
        title: updatedBook.title,
        author: updatedBook.author,
        genre: updatedBook.genre,
        description: updatedBook.description,
        isbn: updatedBook.isbn,
        image: updatedBook.image,
        published: updatedBook.published,
        publisher: updatedBook.publisher,
        isFavorite: updatedBook.isFavorite,
        isRead: updatedBook.isRead,
      ),
    );

    return updatedBook;
  }

  Future<BookModel> toggleRead(BookModel book) async {
    final updatedBook = book.copyWith(isRead: !book.isRead);
    await local.saveBook(
      BookLocalModel(
        id: updatedBook.id,
        title: updatedBook.title,
        author: updatedBook.author,
        genre: updatedBook.genre,
        description: updatedBook.description,
        isbn: updatedBook.isbn,
        image: updatedBook.image,
        published: updatedBook.published,
        publisher: updatedBook.publisher,
        isFavorite: updatedBook.isFavorite,
        isRead: updatedBook.isRead,
      ),
    );

    return updatedBook;
  }

  BookModel loadLocalState(BookModel book) {
    final localBook = local.getBook(book.id);
    if (localBook != null) {
      return book.copyWith(
        isFavorite: localBook.isFavorite,
        isRead: localBook.isRead,
      );
    }
    return book;
  }

  Future<List<BookModel>> getLocalBooks() async {
    final localBooks = local.getAllBooks();
    return localBooks.map((book) {
      return BookModel(
        id: book.id,
        title: book.title,
        author: book.author,
        genre: book.genre,
        description: book.description,
        isbn: book.isbn,
        image: book.image,
        published: book.published,
        publisher: book.publisher,
        isFavorite: book.isFavorite,
        isRead: book.isRead,
      );
    }).toList();
  }
}