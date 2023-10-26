import 'package:dio/dio.dart';
import 'package:test_lima_bean/data/models/content_model.dart';

class ContentProvider {
  final Dio _dio = Dio();

  Future<ContentModel> fetchContent() async {
    final response =
    await _dio.get('https://baconipsum.com/api/?type=meat-and-filler');
    if (response.statusCode == 200) {
      return ContentModel.fromJson(response.data[0]);
    } else {
      throw Exception('Failed to load content');
    }
  }
}