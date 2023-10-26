import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_lima_bean/presentation/bloc/content_bloc.dart';
import 'package:test_lima_bean/presentation/bloc/content_event.dart';
import 'package:test_lima_bean/presentation/bloc/content_state.dart';

import 'home_page.dart';

class ContentPage extends StatelessWidget {
  static const routeName = '/content';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ContentBloc>(context).add(ReloadContent());
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scrolling List'),
        backgroundColor: Colors.greenAccent, // Ubah warna appbar menjadi 'Hijau Mint'
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false,
            );
          },
        ),
      ),
      body: BlocBuilder<ContentBloc, ContentState>(
        builder: (context, state) {
          if (state is ContentInitial || state is ReloadContent) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ContentBloc>(context).add(ReloadContent());
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent, // Ubah warna tombol menjadi 'Hijau Mint'
                ),
                child: Text('Fetch Content'),
              ),
            );
          } else if (state is ContentLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ContentLoaded) {
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final imageUrl =
                          'https://picsum.photos/200/300/?random=${DateTime.now().millisecondsSinceEpoch}';
                      // Gunakan DateTime.now().millisecondsSinceEpoch untuk menambahkan parameter unik ke URL gambar
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Flexible(
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 4),
                              Expanded(
                                child: Text(
                                  state.content,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ContentBloc>(context).add(ReloadContent());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent, // Ubah warna tombol menjadi 'Hijau Mint'
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.refresh), // Tambahkan icon 'Reload' di dalam tombol
                      SizedBox(width: 8),
                      Text('Reload Content'),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text('Failed to load content.'),
            );
          }
        },
      ),
    );
  }
}