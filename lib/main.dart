import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen/loginBrain.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Register',
    home: Connexion(),
  ));
}

class Connexion extends StatelessWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
