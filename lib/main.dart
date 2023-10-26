import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_lima_bean/presentation/bloc/content_bloc.dart';
import 'package:test_lima_bean/presentation/pages/content_page.dart';
import 'package:test_lima_bean/presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContentBloc(httpClient: http.Client()),
      child: MaterialApp(
        title: 'Test Lima Bean',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage()//ContentPage(),
      ),
    );
  }
}