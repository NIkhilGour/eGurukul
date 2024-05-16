import 'package:chat_app/screens/auth.dart';
import 'package:chat_app/screens/bottom_home.dart';
import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Chat',
        theme: ThemeData().copyWith(
          
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 63, 17, 177),
            ),
          
        ),
      
        home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges() , builder: (context, snapshot) {
      
              if(snapshot.connectionState== ConnectionState.waiting)
              {
                  return const SplashScreen();
              }
              if(snapshot.hasData)
              {
                return const BottomHome ();
              }
              return const AuthScreen();
        },)
      ),
    );
  }
}
