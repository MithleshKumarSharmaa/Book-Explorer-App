// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookLocalModelAdapter extends TypeAdapter<BookLocalModel> {
  @override
  final int typeId = 1;

  @override
  BookLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookLocalModel(
      id: fields[0] as int,
      title: fields[1] as String,
      author: fields[2] as String,
      genre: fields[3] as String,
      description: fields[4] as String,
      isbn: fields[5] as String,
      image: fields[6] as String,
      published: fields[7] as String,
      publisher: fields[8] as String,
      isFavorite: fields[9] as bool,
      isRead: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BookLocalModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.genre)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.isbn)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.published)
      ..writeByte(8)
      ..write(obj.publisher)
      ..writeByte(9)
      ..write(obj.isFavorite)
      ..writeByte(10)
      ..write(obj.isRead);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
