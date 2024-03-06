import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location_app/accueil.dart';
import 'package:location_app/connexion.dart';
import 'package:location_app/details.dart';
import 'package:location_app/main.dart';
import 'package:location_app/mon_compte.dart';
import 'package:location_app/publier_logement.dart';
import 'package:http/http.dart' as http;

getUserData(String email) async {
  var url =
      "https://agk007s.000webhostapp.com/comeup_location/getUserData.php?email=$user_email";
  var response = await http.get(Uri.parse(url));
  print(response.statusCode);
  print(response.body);
  var pub = await json.decode(response.body);
  return pub;
}

h(double h) {
  return SizedBox(
    height: h,
  );
}

w(double w) {
  return SizedBox(
    width: w,
  );
}

String passwordEncrypted = "";
String passwordDeEncrypted = "";
String villeSelectionnee = "";
String destinationSelectionnee = "";

Color mainColor = Color.fromARGB(255, 136, 26, 88);

Box(String path, Titre, description) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        h(40),
        Container(height: 259, width: 311, child: Image.asset(path)),
        h(60),
        //Ajout du titre :
        Text(
          Titre,
          style: TextStyle(
            fontFamily: 'normal',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 60),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'normal2', fontSize: 15),
        )
      ],
    ),
  );
}

MAB(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Color.fromARGB(255, 136, 26, 88),
    title: Text(
      "EasyHouse",
      style: TextStyle(fontFamily: 'normal2'),
    ),
    actions: [
      Icon(
        Icons.favorite,
        color: Colors.white,
        size: 25,
      ),
      w(15),
      InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Connexion(),
            )),
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 25,
        ),
      ),
      w(15),
      InkWell(
        onTap: () {
          showMenu(
              context: context,
              position: RelativeRect.fromLTRB(500, 60, 0, 0),
              items: [
               eya? PopupMenuItem<String>(
                    value: '1',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Publier(),)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Publier un logement',
                          style:
                              TextStyle(fontFamily: 'normal2', fontSize: 15),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 190, 7, 56))
                      ],
                    )) : 
                    PopupMenuItem<String>(
                    value: '1',
                    // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Publier(),)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'FAQ',
                          style:
                              TextStyle(fontFamily: 'normal2', fontSize: 15),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 190, 7, 56))
                      ],
                    )),
                    PopupMenuItem<String>(
                    value: '1',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => MonCompte(), )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Mon compte',
                          style:
                              TextStyle(fontFamily: 'normal2', fontSize: 15),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 190, 7, 56))
                      ],
                    )),
                    PopupMenuItem<String>(
                    value: '1',
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Déconnexion',
                            style:
                                TextStyle(fontFamily: 'normal2', fontSize: 15),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 190, 7, 56))
                        ],
                      ),
                    )),
                    PopupMenuItem<String>(
                    value: '1',
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'A Propos de nous',
                            style:
                                TextStyle(fontFamily: 'normal2', fontSize: 15),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 190, 7, 56))
                        ],
                      ),
                    ))
              ]);
        },
        child: Icon(
          Icons.menu,
          color: Colors.white,
          size: 25,
        ),
      ),
      w(15),
    ],
  );
}

Box2(BuildContext context, String path, titre, titre2, montant) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20),
    height: 280,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange)),
    child: Column(
      children: [
        Container(
          height: 198,
          width: 342,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(path), fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    titre,
                    style: TextStyle(fontFamily: 'normal'),
                  ),
                  Text(
                    titre2,
                    style: TextStyle(fontFamily: 'normal2'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    color: Color.fromARGB(137, 255, 153, 0),
                    child: Center(
                      child: Text(
                        montant,
                        style: TextStyle(fontSize: 14, fontFamily: 'normal'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  h(5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Details(imgPath: path, type: titre),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      height: 24,
                      decoration: BoxDecoration(color: mainColor),
                      child: Center(
                        child: Text(
                          "Consulter",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'normal2'),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
