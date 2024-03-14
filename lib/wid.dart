import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:location_app/about.dart';
import 'package:location_app/accueil.dart';
import 'package:location_app/connexion.dart';
import 'package:location_app/details.dart';
import 'package:location_app/faq.dart';
import 'package:location_app/main.dart';
import 'package:location_app/mespub.dart';
import 'package:location_app/mon_compte.dart';
import 'package:location_app/publier_logement.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

getUserData(String email) async {
  var url =
      "https://agk007s.000webhostapp.com/comeup_location/getUserData.php?email=$user_email";
  var response = await http.get(Uri.parse(url));
  print(response.statusCode);
  print(response.body);
  var pub = await json.decode(response.body);
  return pub;
}

flashVente() async {
  var url =
      "https://agk007s.000webhostapp.com/comeup_location/flashvente.php";
  var response = await http.get(Uri.parse(url));
  print(response.statusCode);
  print(response.body);
  var pub = await json.decode(response.body);
  return pub;
}

mesPubs() async {
  var url =
      "https://agk007s.000webhostapp.com/comeup_location/mesPub.php?mailss=$user_email";
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
    // elevation: 0,
    backgroundColor: Color.fromARGB(255, 136, 26, 88),
    title: Row(
      children: [
        Text(
          "Guidi",
          style: TextStyle(fontFamily: 'normal'),
        ),
        Text(
          "Immo",
          style: TextStyle(
              fontFamily: 'normal', color: Color.fromARGB(255, 79, 152, 255)),
        ),
      ],
    ),
    actions: [
  
      eya
          ? Text("")
          : InkWell(
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
      eya ? InkWell(
        onTap: () {
          showMenu(
              context: context,
              position: RelativeRect.fromLTRB(500, 60, 0, 0),
              items: [
                PopupMenuItem<String>(
                        value: '1',
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Publier(),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Publier un logement',
                              style: TextStyle(
                                  fontFamily: 'normal2', fontSize: 15),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 190, 7, 56))
                          ],
                        )),

                        PopupMenuItem<String>(
                        value: '1',
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MesPubs(),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Mes publications',
                              style: TextStyle(
                                  fontFamily: 'normal2', fontSize: 15),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 190, 7, 56))
                          ],
                        )),
                 
                 PopupMenuItem<String>(
                        value: '1',
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MonCompte(),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Mon compte',
                              style: TextStyle(
                                  fontFamily: 'normal2', fontSize: 15),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 190, 7, 56))
                          ],
                        )),
                   
                PopupMenuItem<String>(
                    value: '1',
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      eya = false;
                      prefs.setBool('isConnected', eya);

                      Phoenix.rebirth(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor:
                              const Color.fromARGB(255, 11, 71, 13),
                          content: Text(
                            "Déconnexion réussie",
                            style: TextStyle(
                                fontFamily: 'normal2', color: Colors.white),
                          )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Déconnexion',
                          style: TextStyle(fontFamily: 'normal2', fontSize: 15),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 190, 7, 56))
                      ],
                    )),
                     PopupMenuItem<String>(
                        value: '1',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FAQ(),)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'FAQ',
                              style: TextStyle(
                                  fontFamily: 'normal2', fontSize: 15),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 190, 7, 56))
                          ],
                        )),
                PopupMenuItem<String>(
                    value: '1',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => About(),)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'A Propos de nous',
                          style:
                              TextStyle(fontFamily: 'normal2', fontSize: 15),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 190, 7, 56))
                      ],
                    )),
                    PopupMenuItem<String>(
                    value: '1',
                    onTap: () {
                      // WidgetsBinding.instance!.addPostFrameCallback((_) {launchUrl(Uri.parse("https://wa.me/+22957887411"));});
                      launchUrl(Uri.parse("https://wa.me/+221761435791"));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Signaler un abus',
                          style:
                              TextStyle(fontFamily: 'normal2', fontSize: 15),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 190, 7, 56))
                      ],
                    ))
              ]);
        },
        child: Icon(
          Icons.menu,
          color: Colors.white,
          size: 25,
        ),
      ) : 
      InkWell(
        onTap: () {
          showMenu(
              context: context,
              position: RelativeRect.fromLTRB(500, 60, 0, 0),
              items: [
                
                     PopupMenuItem<String>(
                        value: '1',
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FAQ(),)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'FAQ',
                              style: TextStyle(
                                  fontFamily: 'normal2', fontSize: 15),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Color.fromARGB(255, 190, 7, 56))
                          ],
                        )),
                PopupMenuItem<String>(
                    value: '1',
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => About(),)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'A Propos de nous',
                          style:
                              TextStyle(fontFamily: 'normal2', fontSize: 15),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 190, 7, 56))
                      ],
                    )),
                    PopupMenuItem<String>(
                    value: '1',
                    onTap: () {
                      launchUrl(Uri.parse("https://wa.me/+221761435791"));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Signaler un abus',
                          style:
                              TextStyle(fontFamily: 'normal2', fontSize: 15),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 190, 7, 56))
                      ],
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

Box2(BuildContext context, String path, titre, titre2, montant, int id) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
    height: 280,
    width: MediaQuery.of(context).size.width / 1.3,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.orange)),
    child: Column(
      children: [
        Container(
          height: 180,
          width: 342,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(path), fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titre,
                    style: TextStyle(fontFamily: 'normal'),
                  ),
                  h(16),
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
                    height: 40,
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 5,
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(137, 255, 153, 0),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        montant + " FCFA",
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
                                Details(imgPath: path, type: titre, id: id),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      height: 30,
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

FlashVente(BuildContext context, String path,titre) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(left: 15),
    height: 200,
    width: 200,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(path), fit: BoxFit.cover)),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange),
              child: Center(
                child: Icon(Icons.favorite, size: 17),
              ),
            )
          ],
        ),
        h(50),
        Container(
          height: 30,
          width: 140,
          color: Color.fromARGB(171, 255, 153, 0),
          child: Center(
            child: Text(
              titre,
              style: TextStyle(fontSize: 13, fontFamily: 'normal'),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        h(40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Color.fromARGB(252, 0, 255, 42),
                  size: 15,
                ),
                Icon(Icons.star,
                    color: Color.fromARGB(252, 0, 255, 42), size: 15),
                Icon(Icons.star,
                    color: Color.fromARGB(252, 0, 255, 42), size: 15),
                Icon(Icons.star_border_outlined,
                    color: Color.fromARGB(252, 0, 255, 42), size: 15),
                Icon(Icons.star_border_outlined,
                    color: Color.fromARGB(252, 0, 255, 42), size: 15),
              ],
            ),
            Container(
              padding: EdgeInsets.all(2.5),
              height: 24,
              width: 50,
              decoration: BoxDecoration(color: mainColor),
              child: Center(
                child: Text(
                  "Voir",
                  style: TextStyle(color: Colors.white, fontFamily: 'normal2'),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
