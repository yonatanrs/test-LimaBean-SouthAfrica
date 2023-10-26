import 'package:test_lima_bean/presentation/bloc/content_bloc.dart';

abstract class ContentEvent {}

class FetchContent extends ContentEvent {}

class ReloadContent extends ContentEvent {}