import 'package:flutter/material.dart';
import 'package:chat_app/model/news.dart';
import 'package:chat_app/screens/news_detail.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetail(newsurl: news.url),
                  ),
                );
              },
        child: ListTile(

          focusColor: Colors.lightBlue,
          leading: SizedBox(
            width: 100,
            
            height: MediaQuery.of(context).size.height,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                news.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(news.title,overflow: TextOverflow.ellipsis,),
          subtitle: Text(news.desc,overflow: TextOverflow.ellipsis,),
         
        ),
      ),
    );
  }
}
