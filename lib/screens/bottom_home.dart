import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/study_material.dart';
import 'package:flutter/material.dart';

class BottomHome extends StatefulWidget {
  const BottomHome({super.key});

  @override
  State<BottomHome> createState() => _BottomHomeState();
}

class _BottomHomeState extends State<BottomHome> {
  int _selectedindex =0;
  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }
    List<Widget> widgetoption = [const HomeScreen(),const ChatScreen(),const StudyMaterial()];

    return Scaffold(body: Center(child: widgetoption[_selectedindex],),

         bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,color: Colors.black,),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes_rounded,color:  Colors.black,),
            label: 'Notes',
          ),
        ],
        currentIndex: _selectedindex,
        selectedItemColor: Colors.blue,
        onTap :(value) {
            onItemTapped(value);
        },
      ),
    );
  
  }
}