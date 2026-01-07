class BookModel {
  final int id;
  final String title;
  final String author;
  final String genre;
  final String description;
  final String isbn;
  final String image;
  final String published;
  final String publisher;
  bool isFavorite;
  bool isRead;

  BookModel({
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

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
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

  BookModel copyWith({bool? isFavorite, bool? isRead}) {
    return BookModel(
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
}
