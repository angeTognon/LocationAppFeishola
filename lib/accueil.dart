import 'package:flutter/material.dart';
import 'package:location_app/resultat.dart';
import 'package:location_app/wid.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAB(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: mainColor,
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Décrouvrez votre prochain logement de qualité et à moindre coût depuis votre smartphone",
                              style: TextStyle(
                                  fontFamily: 'normal2',
                                  fontSize: 14,
                                  color: Colors.white),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                // color: const Color.fromARGB(255, 100, 43, 43),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/logo_.png"),
                                    fit: BoxFit.fill)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 30,
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 235, 235, 235),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rechercher",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 3,
              width: 120,
              color: Colors.orange,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recherche par catégorie",
                    style: TextStyle(fontFamily: "normal"),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Voir tout",
                      style: TextStyle(fontFamily: "normal2", color: mainColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Box1("assets/images/x0.png", "Appartements"),
                  Box1("assets/images/x1.png", "Chambre simple"),
                  Box1("assets/images/x2.png", "Studios"),
                  Box1("assets/images/x3.png", "Appartements meublés"),
                  w(20)
                ],
              ),
            ),
            h(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Publication récente",
                  style: TextStyle(fontFamily: "normal", fontSize: 15),
                ),
              ],
            ),
            h(20),
            Container(height: 450,width: MediaQuery.of(context).size.width/1.14,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 250,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/images/x1.png"),
                            fit: BoxFit.cover)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 40,
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
                        h(60),
                        Container(
                          height: 40,
                          width: 140,
                          color: Color.fromARGB(171, 255, 153, 0),
                          child: Text(
                            "Chambre Salon Sanitaire",
                            style: TextStyle(fontSize: 13, fontFamily: 'normal'),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        h(60),
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
                                    color: Color.fromARGB(252, 0, 255, 42),
                                    size: 15),
                                Icon(Icons.star,
                                    color: Color.fromARGB(252, 0, 255, 42),
                                    size: 15),
                                Icon(Icons.star_border_outlined,
                                    color: Color.fromARGB(252, 0, 255, 42),
                                    size: 15),
                                Icon(Icons.star_border_outlined,
                                    color: Color.fromARGB(252, 0, 255, 42),
                                    size: 15),
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
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'normal2'),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(right: 0,
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      padding: EdgeInsets.all(10),
                      height: 170,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/images/x2.png"),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40,
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
                          h(20),
                          Container(
                            height: 40,
                            width: 140,
                            color: Color.fromARGB(171, 255, 153, 0),
                            child: Text(
                              "Deux chambres salon sanitaire ",
                              style: TextStyle(fontSize: 13, fontFamily: 'normal'),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          h(20),
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
                                      color: Color.fromARGB(252, 0, 255, 42),
                                      size: 15),
                                  Icon(Icons.star,
                                      color: Color.fromARGB(252, 0, 255, 42),
                                      size: 15),
                                  Icon(Icons.star_border_outlined,
                                      color: Color.fromARGB(252, 0, 255, 42),
                                      size: 15),
                                  Icon(Icons.star_border_outlined,
                                      color: Color.fromARGB(252, 0, 255, 42),
                                      size: 15),
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
                                    style: TextStyle(
                                        color: Colors.white, fontFamily: 'normal2'),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 270,
                    child: Container(
                      margin: EdgeInsets.only(left: 0),
                      padding: EdgeInsets.all(10),
                      height: 170,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/images/x3.png"),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40,
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
                          h(20),
                          Container(
                            height: 30,
                            width: 140,
                            color: Color.fromARGB(171, 255, 153, 0),
                            child: Center(
                              child: Text(
                                "Studios ",
                                style:
                                    TextStyle(fontSize: 13, fontFamily: 'normal'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          h(30),
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
                                      color: Color.fromARGB(252, 0, 255, 42),
                                      size: 15),
                                  Icon(Icons.star,
                                      color: Color.fromARGB(252, 0, 255, 42),
                                      size: 15),
                                  Icon(Icons.star_border_outlined,
                                      color: Color.fromARGB(252, 0, 255, 42),
                                      size: 15),
                                  Icon(Icons.star_border_outlined,
                                      color: Color.fromARGB(252, 0, 255, 42),
                                      size: 15),
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
                                    style: TextStyle(
                                        color: Colors.white, fontFamily: 'normal2'),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,right: 0,
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      padding: EdgeInsets.all(10),
                      height: 250,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/images/x4.png"),
                              fit: BoxFit.cover)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 40,
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
                          h(60),
                          Container(
                            height: 40,
                            width: 140,
                            color: Color.fromARGB(171, 255, 153, 0),
                            child: Text(
                              "Appartement meublé",
                              style: TextStyle(fontSize: 13, fontFamily: 'normal'),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          h(60),
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
                                      color: Color.fromARGB(252, 0, 255, 42),
                                      size: 15),
                                  Icon(Icons.star,
                                      color: Color.fromARGB(252, 0, 255, 42),
                                      size: 15),
                                  Icon(Icons.star_border_outlined,
                                      color: Color.fromARGB(252, 0, 255, 42),
                                      size: 15),
                                  Icon(Icons.star_border_outlined,
                                      color: Color.fromARGB(252, 0, 255, 42),
                                      size: 15),
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
                                    style: TextStyle(
                                        color: Colors.white, fontFamily: 'normal2'),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            h(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Publication la mieux notée et\nappréciée",
                  style: TextStyle(fontFamily: "normal", fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            h(10),
            Box2(context,"assets/images/x4.png", "Appartement meublé","Publiée le 1 Mars 2024", "20.000F/mois"),
            h(40)
          ],
        ),
      ),
    );
  }

  Box1(String path, titre) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Resultat(),));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15),
        height: 140,
        width: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 235, 235, 235),),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(path), fit: BoxFit.cover)),
            ),
            h(10),
            Text(
              titre,
              style: TextStyle(fontFamily: 'normal2'),
            ),
          ],
        ),
      ),
    );
  }

  
}


