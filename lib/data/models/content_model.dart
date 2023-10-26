import 'package:test_lima_bean/domain/entities/content.dart';

class ContentModel {
  final String text;

  ContentModel(this.text);

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(json['text']);
  }
}