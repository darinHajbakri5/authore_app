import 'package:dio/dio.dart';

class AuthorApiClient {
  static const baseUrl = 'https://openlibrary.org';
  final Dio dio;

  AuthorApiClient({Dio? dio}) : dio = dio ?? Dio();

  Future<List<dynamic>> fetchAuthors(String name) async {
    try {
      final response = await dio
          .get('$baseUrl/search/authors.json', queryParameters: {'q': name});
      return response.data['docs'];
    } catch (e) {
      throw Exception('Failed to load authors: $e');
    }
  }

  Future<List<dynamic>> fetchWorks(String authorId) async {
    try {
      final response = await dio.get('$baseUrl/authors/$authorId/works.json');
      return response.data['entries'];
    } catch (e) {
      throw Exception('Failed to load author works: $e');
    }
  }
}
