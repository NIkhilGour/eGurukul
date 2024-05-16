import 'package:chat_app/screens/pdf_view.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  const BookTile({super.key,required this.bookname,required this.subject,required this.bookurl});
  final String bookname;
  final String subject;
  final String bookurl;
  @override
  Widget build(BuildContext context) {
    
    return  ListTile(
      title: Text(bookname,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      subtitle: Text(subject,style: const TextStyle(fontStyle: FontStyle.italic),),
      trailing: IconButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MyPdfViewer(pdfPath: bookurl);
        },));
      }, icon:const Icon(Icons.arrow_right),
      

      ),
      leading: const Icon(Icons.book,color: Colors.red,),
     
    );
  }
}