import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location_app/wid.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Resultat extends StatefulWidget {
  String titre = "";
  Resultat({required this.titre});
  @override
  State<Resultat> createState() => _ResultatState();
}

class _ResultatState extends State<Resultat> {
  String dropdownvalue = 'Cliquez ici';

  var items = [
    'Cliquez ici',
    'Le moins chère',
    'Le plus chère',
    '10.000 F à 15.000 F',
    '16.000 F à 35.000 F',
    'Plus de 45.000 F',
  ];

  String dropdownvalueVille = 'Cliquez ici';

  var itemsVille = [
    'Cliquez ici',
    'Sacré cœur derkle',
    'Niary Tally',
    'Ben Tally',
    'Dakar plateau',
    'Castor',
    'Front de terre',
    'Hanane mariste',
    'Dalifort',
    'Scat urban',
    'Amitiés',
    'Cité mixta',
    'Sud foire',
    'Yeumbeul',
    'Thiaroye',
  ];

  search() async {
    var url =
        "https://agk007s.000webhostapp.com/comeup_location/getData.php?titre=${widget.titre}";
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response.body);
    var pub = await json.decode(response.body);
    return pub;
  }

  bool dataDisplayed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MAB(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: search(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Erreur de chargement. Veuillez relancer l'application"),
              );
            }
            if (snapshot.hasData) {
              print(snapshot.data);
              return snapshot.data.isEmpty
                  ? Column(
                      children: [
                        h(20),
                        Icon(
                          Icons.safety_check_rounded,
                          size: 100,
                          color: mainColor,
                        ),
                        h(20),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            "Oups, il n'y a pas encore de contenu pour ce type de logement ",
                            style: TextStyle(fontSize: 17),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        if(!dataDisplayed){
                          dataDisplayed = true;
                          return Column(
                          children: [
                            Column(
            children: [
              h(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Résultats de recherche",
                    style: TextStyle(fontFamily: 'normal', fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 250,
                      height: 250,
                      child: Image.asset("assets/images/resultats.png")),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Filtrer par",
                  style: TextStyle(fontFamily: 'normal', fontSize: 18),
                ),
              ),
              h(15),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prix",
                      style: TextStyle(fontFamily: 'normal2', fontSize: 17,fontWeight: FontWeight.w600),
                    ),
                    DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              h(5),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Titre",
                      style: TextStyle(fontFamily: 'normal2', fontSize: 17,fontWeight: FontWeight.w600),
                    ),
                    DropdownButton(
                      value: dropdownvalueVille,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: itemsVille.map((String itemsVille) {
                        return DropdownMenuItem(
                          value: itemsVille,
                          child: Text(itemsVille),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalueVille = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              h(5),
            ],
          ),
                            Box2(context,
                              "${snapshot.data![index]['linkss']}",
                              "${snapshot.data![index]['titre']}",
                              "Publiée le ${snapshot.data![index]['temps']}",
                              "${snapshot.data![index]['prix']}",int.parse("${snapshot.data![index]['id']}")),
                          ],
                          );
                        }
                       else{
                        return Column(
                          children: [
                            Box2(
                                context,
                                "${snapshot.data![index]['linkss']}",
                                "${snapshot.data![index]['titre']}",
                                "Publiée le ${snapshot.data![index]['temps']}",
                                "${snapshot.data![index]['prix']}",int.parse("${snapshot.data![index]['id']}")),
                          ],
                        );
                       } 
                      },
                    );
            }
            return Center(
                child: Container(
                    height: 150,
                    width: 150,
                    child:
                        Lottie.asset("assets/images/auto_loading.json")));
          },
        ),
      ),
    );
  }
}
