import 'package:connexion/screen/homeBrain.dart';
import 'package:connexion/screen/loginBrain.dart';
import 'package:connexion/screen/registerBrain.dart';
import 'package:flutter/material.dart';
import '../component/background.dart';
import '../component/InputWidget.dart';
final TextEditingController nom = TextEditingController();
final TextEditingController mdp = TextEditingController();

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  recuperer() {
    String username = nom.text;
    String motdepasse = mdp.text;
    String resultat = username + '.' + motdepasse;

    print(resultat);
  }
  final _formKey = GlobalKey<FormState>();
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
                        'Réinitialiser votre mot de passe',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  InputWidget('Email',Icons.mail,nom),
                  InputWidget('Nouveau mot de passe',Icons.password,mdp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Login()),
                            );
                          },
                          child: Text("Se connecter ?")
                      ),
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
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            recuperer();
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Home()),
                          );
                        },
                        child: Text('Réinitialiser')
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Register()),
                        );
                      },
                          child: Text("S'inscrire ?")
                      ),
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
