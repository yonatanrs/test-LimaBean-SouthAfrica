import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'content_event.dart';
import 'content_state.dart';
import 'package:test_lima_bean/domain/entities/content.dart';
import 'package:test_lima_bean/domain/repositories/content_repository.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final http.Client httpClient;

  ContentBloc({required this.httpClient}) : super(ContentInitial());

  @override
  Stream<ContentState> mapEventToState(ContentEvent event) async* {
    if (event is FetchContent || event is ReloadContent) {
      yield ContentLoading();
      try {
        final response = await httpClient.get(Uri.parse(
            'https://baconipsum.com/api/?type=meat-and-filler'));
        final content = json.decode(response.body)[0];
        final imageUrl =
            'https://picsum.photos/200/300/?random'; // URL gambar acak dari API
        yield ContentLoaded(content: content, imageUrl: imageUrl);
      } catch (_) {
        yield ContentError();
      }
    }
  }
}