import 'package:flutter/material.dart';
import 'package:chat_app/model/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      
      child: Stack(
      
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(category.image,fit: BoxFit.cover,),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(118, 0, 0, 0),
                borderRadius: BorderRadius.all(Radius.circular(20))
                
              ),
              child: Center(child: Text(category.title,style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),)),
            ),
          )
        ],
      ),
    );
  }
}
