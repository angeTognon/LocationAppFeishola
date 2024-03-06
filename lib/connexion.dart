import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location_app/accueil.dart';
import 'package:location_app/inscription.dart';
import 'package:location_app/main.dart';
import 'package:location_app/wid.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final emailController = TextEditingController();
  final mpController = TextEditingController();
  bool show =false;
  login() async {
    setState(() {
      show = true;
    });
    print("coucou");
    
    var url =
        "https://agk007s.000webhostapp.com/comeup_location/connexion.php";
    var response = await http.post(Uri.parse(url),
        body: {'email': emailController.text, 'mp': mpController.text});

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var data = json.decode(response.body);
    print(data);
    if (data == "Success") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color.fromARGB(255, 3, 78, 5),
        content: Text("Connexion Réussie"),
      ));
       final prefs = await SharedPreferences.getInstance();
        eya = true;
        prefs.setBool('isConnected', eya);

        user_email=emailController.text;

        final userPref = await SharedPreferences.getInstance();
        
        userPref.setString('email',emailController.text);
        show = false;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Accueil(),
          ));
    } else {
      setState(() {
        show = false;
      });
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Attention"),
          content: Text(
              "L'email ou le mot de passe n'exite pas ! Veuillez réessayer"),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Ok"))
          ],
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MAB(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,width: 150,
                    child: Image.asset("assets/images/login.png")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Connexion",
                    style: TextStyle(fontSize: 18, fontFamily: 'normal'),
                  )
                ],
              ),
              h(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.orange,
                    height: 4,
                    width: 70,
                  ),
                ],
              ),
              h(20),
              Text(
                "Email",
                style: TextStyle(fontSize: 14, fontFamily: 'normal'),
              ),
              h(15),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Container(
                  height: 50,
                  width: 230,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration.collapsed(
                        hintText: "Veuillez entrer votre adresse mail",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(10),
              Text(
                "Mot de passe",
                style: TextStyle(fontSize: 14, fontFamily: 'normal'),
              ),
              h(10),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Container(
                  height: 50,
                  width: 230,
                  child: TextFormField(
                    controller: mpController,
                    obscureText: true,
                    decoration: InputDecoration.collapsed(
                        hintText: "*************",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.orange,
                    height: 4,
                    width: 70,
                  ),
                ],
              ),
              h(20),
              show ? Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ) : InkWell(
                onTap: () {
                  login();
                },
                child: Container(
                  height: 50,width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                  color: mainColor,
                   borderRadius: BorderRadius.circular(12) 
                  ),
                  child: Center(
                    child: Text("Me Connecter",style: TextStyle(
                      color: Colors.white,fontSize: 16,fontFamily: 'normal2',
                    ),),
                  ),
                ),
              ),
              h(10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Vous n'avez pas de compte ?",style: TextStyle(
                    fontFamily: 'normal2'
                  ),),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Inscription()));
                    },
                    child: Text("S'inscrire",style: TextStyle(
                      fontFamily: 'normal'
                    ),),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
