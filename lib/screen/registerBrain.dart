import 'package:connexion/screen/homeBrain.dart';
import 'package:flutter/material.dart';
import '../component/background.dart';
import '../component/InputWidget.dart';
import 'loginBrain.dart';
final TextEditingController nom = TextEditingController();
final TextEditingController mdp = TextEditingController();
final TextEditingController mail = TextEditingController();

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  recuperer() {
    String username = nom.text;
    String motdepasse = mdp.text;
    String email = mail.text;
    String resultat = username + motdepasse + email;

    print(resultat);
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
                        'Inscrivez-vous',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  InputWidget('Email',Icons.mail,mail),
                  InputWidget('Nom utilisateur',Icons.supervised_user_circle,nom),
                  InputWidget('Mot de passe',Icons.password,mdp),
                  InputWidget('Confirmez votre mot de passe',Icons.password,mdp),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 180,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: (){
                          recuperer();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Home()),
                          );
                        },
                        child: Text("S'inscrire")
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
                          MaterialPageRoute(builder: (context) => const Login()),
                        );
                      },
                          child: Text("Déja inscrit ?")
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

