import 'package:flutter/material.dart';
import 'package:location_app/details.dart';
import 'package:location_app/resultat.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:location_app/wid.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final List<String> searchElements = [
    'Studio',
    'Mini Studio',
    'Appartement',
    'Chambre Simple',
    'Chambre Toilette',
    'Chambre Cuisine',
    'Chambre Meublée',
    'Maison',
  ];

  String selectedElement = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAB(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              child: Stack(
                children: [
                  Positioned(

                    child: Container(
                      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                      color: mainColor,
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Découvrez un logement abordable de qualité depuis votre smartphone.",
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
                                    image: AssetImage("assets/images/new.png"),
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
                              borderRadius: BorderRadius.circular(12)),
                          child: TypeAheadField(
                            textFieldConfiguration: TextFieldConfiguration(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Cliquez ici pour Rechercher',
                                  hintStyle: TextStyle(
                                      fontFamily: 'normal2', fontSize: 15)),
                            ),
                            suggestionsCallback: (pattern) {
                              return searchElements
                                  .where((fruit) => fruit
                                      .toLowerCase()
                                      .contains(pattern.toLowerCase()))
                                  .toList();
                            },
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: Text(suggestion),
                              );
                            },
                            onSuggestionSelected: (suggestion) {
                              setState(() {
                                selectedElement = suggestion;
                                print(selectedElement);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Resultat(titre: selectedElement)));
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 3,
              width: 120,
              color: Color.fromARGB(255, 136, 26, 88),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Recherche par catégorie",
                    style: TextStyle(fontFamily: "normal",fontSize: 19,color: Color.fromARGB(255, 136, 26, 88),),
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
                  Box1("assets/images/location1.jpg", "Studio"),
                  Box1("assets/images/x1.png", "Mini Studio"),
                  Box1("assets/images/x2.png", "Appartement"),
                  Box1("assets/images/x2.png", "Chambre Simple"),
                  Box1("assets/images/x3.png", "Chambre Toilette"),
                  Box1("assets/images/x4.png", "Chambre Cuisine"),
                  Box1("assets/images/x5.png", "Chambre Meublée"),
                  Box1("assets/images/x1.png", "Maison"),
                  w(20),
                ],
              ),
            ),
            h(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mo Geuneu",
                  style: TextStyle(fontFamily: "normal", fontSize: 18,color: Color.fromARGB(255, 136, 26, 88),),
                ),
              ],
            ),
            h(20),
            Container(
              height: 220,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: flashVente(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                          "Erreur de chargement. Veuillez relancer l'application"),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Wrap(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Details(
                                              imgPath: snapshot.data![index]
                                                  ['linkss'],
                                              type: snapshot.data![index]
                                                  ['titre'],
                                              id: int.parse(
                                                  snapshot.data![index]['id']),
                                            )));
                              },
                              child: FlashVente(
                                  context,
                                  snapshot.data![index]['linkss'],
                                  snapshot.data![index]['titre']),
                            )
                          ],
                        );
                      },
                    );
                  }
                  return Container(
                      height: 50,
                      width: 50,
                      child: Center(
                          child: Lottie.asset("assets/images/auto_loading.json",
                              height: 150)));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                h(10),
                Text(
                  "Nos partenaires",
                  style: TextStyle(fontFamily: "normal", fontSize: 18,color: Color.fromARGB(255, 136, 26, 88),),
                ),
              ],
            ),
            h(20),
            CarouselSlider(
                items: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(

                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)
                      ),
                        child: Image.asset("assets/images/s1.png",height: 120,)),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        height: 120,
                        decoration: BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                spreadRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Image.asset("assets/images/s4.png",height: 120)),
                  ),
                ],
                options: CarouselOptions(
                  height: 120,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.4,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 4),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.linear,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),
            h(20)
          ],
        ),
      ),
    );
  }

  Box1(String path, titre) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Resultat(
                titre: titre,
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15),
        height: 140,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 235, 235, 235),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                height: 100,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        image: AssetImage(path), fit: BoxFit.cover)),
              ),
            ),
            h(10),
            Text(
              titre,
              style: TextStyle(fontFamily: 'normal2',fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
