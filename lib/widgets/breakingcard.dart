import 'package:flutter/material.dart';
import 'package:chat_app/model/news.dart';

class BreakingNewsCard extends StatelessWidget {
  const BreakingNewsCard({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    return Container(
         
          child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(news.image,fit: BoxFit.cover, width: 200,height: 200,)),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(125, 0, 0, 0),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      
                      child: Text(news.title,overflow: TextOverflow.ellipsis,style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                            
                      ),),
                    ),
                  ),
              ))
          ],),
    );
  }
}