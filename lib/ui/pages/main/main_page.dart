import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta/ui/const/route.dart';
import 'package:insta/ui/pages/auth/login_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('home'),
          ElevatedButton(
            onPressed: () async {
              MRoute.replace(context, LoginPage());
              await FirebaseAuth.instance.signOut();
            },
            child: Text('выйти'),
          ),
        ],
      ),
    );
  }
}
