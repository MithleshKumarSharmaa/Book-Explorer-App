import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:take_home/data/models/book_model.dart';
import 'dart:io';

class BookRemoteDataSource {
  static const _url = 'https://fakerapi.it/api/v2/books?_quantity=10';

  Future<List<BookModel>> fetchBooks() async {
    try {
      final response = await http
          .get(Uri.parse(_url))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final body = json.decode(response.body);

        final List data = body['data'] ?? [];

        if (data.isEmpty) {
          throw AppException('No books available right now.');
        }

        return data.map((e) => BookModel.fromJson(e)).toList();
      }

      throw AppException(
        'Server error (${response.statusCode}). Please try again later.',
      );
    } on SocketException {
      throw AppException('No internet connection.\nPlease check your network.');
    } on TimeoutException {
      throw AppException('Connection timeout.\nPlease try again.');
    } on FormatException {
      throw AppException('Invalid data received from server.');
    } catch (e) {
      throw AppException('Something went wrong.\nPlease try again.');
    }
  }
}

class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}
