import 'package:test_lima_bean/domain/entities/content.dart';
import 'package:test_lima_bean/data/providers/content_provider.dart';

class ContentRepository {
  final ContentProvider contentProvider = ContentProvider();

  Future<Content> fetchContent() async {
    final contentModel = await contentProvider.fetchContent();
    return Content(contentModel.text);
  }
}