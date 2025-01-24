import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/home_screen.dart';
import 'package:login/splash_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasError){
              return const Text("Error");
            }else {
              if(snapshot.data == null){
                return const SplashScreen();
              }else{
                return const HomeScreen();
              }
            }
          }),
    );
  }
}
