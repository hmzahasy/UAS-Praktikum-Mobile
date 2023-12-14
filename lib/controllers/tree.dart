import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/screens/login_screen.dart';
import 'package:movies_app/screens/main.dart';
import 'package:movies_app/service/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(tree());
}


class tree extends StatefulWidget {
  tree({Key? key}) : super(key: key);

  @override
  State<tree> createState() => _treeState();
}

class _treeState extends State<tree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return Main();
        } else {
          return Login();
        }
      },
    );
  }
}
