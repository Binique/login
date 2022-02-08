import 'package:connexion/screen/homeBrain.dart';
import 'package:connexion/screen/passwordBrain.dart';
import 'package:connexion/screen/registerBrain.dart';
import 'package:flutter/material.dart';
import '../component/background.dart';
import '../component/InputWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
FirebaseAuth auth = FirebaseAuth.instance;

final TextEditingController nom = TextEditingController();
final TextEditingController mdp = TextEditingController();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  recuperer() {
    String username = nom.text;
    String motdepasse = mdp.text;
    String resultat = username + '.' + motdepasse;

    print(resultat);
  }
  final _formKey = GlobalKey<FormState>();
signin() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: nom.text,
        password: mdp.text
    );
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const Home()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        'Logo',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        'Connectez-vous',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  InputWidget(
                      'Nom utilisateur', Icons.supervised_user_circle, nom),
                  InputWidget('Mot de passe', Icons.password, mdp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Password()),
                            );
                          },
                          child: Text("Mot de passe oublié ?")),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 180,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                     if (_formKey.currentState!.validate()) {
                         signin();
                         }
                        },
                        child: Text('Connexion')),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()),
                            );
                          },
                          child: Text("S'inscrire ?")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
