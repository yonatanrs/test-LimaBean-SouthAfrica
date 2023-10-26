import 'package:test_lima_bean/data/models/content_model.dart';
import 'package:test_lima_bean/data/providers/content_provider.dart';
import 'package:test_lima_bean/domain/entities/content.dart';

class ContentRepository {
  final ContentProvider contentProvider = ContentProvider();

  Future<Content> fetchContent() async {
    final ContentModel contentModel = await contentProvider.fetchContent();
    return Content(contentModel.text);
  }
}