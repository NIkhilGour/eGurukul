import 'package:flutter/material.dart';
import 'package:chat_app/model/news.dart';

class NewsCard extends StatelessWidget {
    NewsCard({super.key, required this.news});

  News news;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Hero(
              tag:  ValueKey(news.title),
              child: Image.network(
                news.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 50,
              //width: MediaQuery.of(context).size.width*0.85,
              decoration: const BoxDecoration(
                color: Color.fromARGB(111, 0, 0, 0),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
              ),
              child: Text(news.title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );

     
  }
}
