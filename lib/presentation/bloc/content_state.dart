import 'package:test_lima_bean/presentation/bloc/content_bloc.dart';

abstract class ContentState {}

class ContentInitial extends ContentState {}

class ContentLoading extends ContentState {}

class ContentLoaded extends ContentState {
  final String content;
  final String imageUrl;

  ContentLoaded({required this.content, required this.imageUrl});
}

class ContentError extends ContentState {}