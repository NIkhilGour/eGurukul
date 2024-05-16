import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser;
    return StreamBuilder(stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt',descending: true).snapshots(), builder: (context, snapshot) {
           if(snapshot.connectionState == ConnectionState.waiting)
           {
              return const Center(
                child: CircularProgressIndicator(),
              );
           }
           
           if(!snapshot.hasData || snapshot.data!.docs.isEmpty)
           {
                return const Center(child: Text('No message found'),);
           }

           if(snapshot.hasError)
           {
            return const Center(child: Text('Something went wrong...'),);
           }

            final loadedmsg = snapshot.data!.docs;
           return ListView.builder(
            padding: const EdgeInsets.only(bottom: 40,left: 13,right: 13),
            reverse: true,
            itemBuilder: (context, index) {
               
               final chatmessage = loadedmsg[index].data();
               final nextChatmsg = index+1< loadedmsg.length ? loadedmsg[index+1].data():null;

               final currentmsgUserid = chatmessage['userId'];
               final nextmessageuserid =  nextChatmsg!=null? nextChatmsg['userId']:null;

               final nextuserIssame = nextmessageuserid == currentmsgUserid;

               if(nextuserIssame)
               {
                  return MessageBubble.next(message: chatmessage['text'], isMe: authenticatedUser!.uid == currentmsgUserid);
               }
               else
               {
                  return MessageBubble.first(userImage: chatmessage['userImage'], username: chatmessage['username'], message: chatmessage['text'], isMe: authenticatedUser!.uid == currentmsgUserid );
               }

                  
           },itemCount: loadedmsg.length,);
    },);
    
  }
}