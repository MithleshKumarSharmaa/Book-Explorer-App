import 'package:hive/hive.dart';

part 'book_local_model.g.dart';

@HiveType(typeId: 1)
class BookLocalModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String author;

  @HiveField(3)
  final String genre;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String isbn;

  @HiveField(6)
  final String image;

  @HiveField(7)
  final String published;

  @HiveField(8)
  final String publisher;

  @HiveField(9)
  bool isFavorite;

  @HiveField(10)
  bool isRead;

  BookLocalModel({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.description,
    required this.isbn,
    required this.image,
    required this.published,
    required this.publisher,
    this.isFavorite = false,
    this.isRead = false,
  });

  BookLocalModel copyWith({bool? isFavorite, bool? isRead}) {
    return BookLocalModel(
      id: id,
      title: title,
      author: author,
      genre: genre,
      description: description,
      isbn: isbn,
      image: image,
      published: published,
      publisher: publisher,
      isFavorite: isFavorite ?? this.isFavorite,
      isRead: isRead ?? this.isRead,
    );
  }

  factory BookLocalModel.fromJson(Map<String, dynamic> json) {
    return BookLocalModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      genre: json['genre'] ?? '',
      description: json['description'] ?? '',
      isbn: json['isbn'] ?? '',
      image: json['image'] ?? '',
      published: json['published'] ?? '',
      publisher: json['publisher'] ?? '',
    );
  }
}
