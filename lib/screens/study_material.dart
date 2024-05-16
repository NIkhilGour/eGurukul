import 'package:chat_app/widgets/booktile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:chat_app/model/booksname.dart';

class StudyMaterial extends StatelessWidget {
  const StudyMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Books',
          style: TextStyle(
              color: Colors.blue,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
        shadowColor: Colors.blue,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: booklist.length,
          itemBuilder: (context, index) {
            return BookTile(
              bookname: booklist[index].first,
              subject: booklist[index].second,
              bookurl: booklist[index].bookurl,
            );
          },
        ),
      ),
    );
  }
}
