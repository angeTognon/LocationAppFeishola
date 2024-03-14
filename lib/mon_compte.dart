import 'package:flutter/material.dart';
import 'package:location_app/main.dart';
import 'package:lottie/lottie.dart';
import 'package:location_app/wid.dart';

class MonCompte extends StatefulWidget {
  const MonCompte({super.key});

  @override
  State<MonCompte> createState() => _MonCompteState();
}

class _MonCompteState extends State<MonCompte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAB(context),
      body: Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: getUserData(user_email),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Erreur de chargement. Veuillez relancer l'application"),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: mainColor),
                            child: Center(
                              child: Icon(
                                Icons.person_2_rounded,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      h(30),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ),
                      snapshot.data![index]['typeCompte']=="Je veux publier des logements" ? Column(
                        children: [
                      h(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Etat du Compte : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    fontFamily: 'noamrl2',
                                    color: Color.fromARGB(174, 0, 0, 0)),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 248, 30, 14),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Non Activé",
                                  // snapshot.data![index]['etat'],
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          h(10),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "A lire Attentivement",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: mainColor,
                                            padding: EdgeInsets.all(10)),
                                        onPressed: () {
                                          // launchUrl(Uri.parse("${snapshot.data![index]['lien']}"));
                                        },
                                        child: Text("Effectuer le paiement")),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: mainColor,
                                                padding: EdgeInsets.all(10)),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Annuler")),
                                      ],
                                    )
                                  ],
                                  content: Container(
                                    padding: EdgeInsets.all(15),
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        Text(
                                            "L'activation de votre compte requiet un paiement de 2000 F, une fois à vie, via l'opérateur FedaPay.",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Activer mon Compte",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          h(20),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.black,
                          ),
                        ],
                      ) : Text(""),
                      h(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nom et Prénom : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color.fromARGB(174, 0, 0, 0)),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(75, 153, 55, 10),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              snapshot.data![index]['nomPrenoms'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                          )
                        ],
                      ),
                      h(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pays : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color.fromARGB(174, 0, 0, 0)),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(75, 153, 55, 10),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              snapshot.data![index]['pays'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                          )
                        ],
                      ),
                      h(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Numéro de téléphone : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color.fromARGB(174, 0, 0, 0)),
                          ),
                          Container(
                            width: 150,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(75, 153, 55, 10),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              snapshot.data![index]['nomPrenoms'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      h(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color.fromARGB(174, 0, 0, 0)),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(75, 153, 55, 10),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              snapshot.data![index]['email'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                          )
                        ],
                      ),
                      h(20),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ),
                      h(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Type de compte : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color.fromARGB(174, 0, 0, 0)),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(75, 153, 55, 10),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              snapshot.data![index]['typeCompte']=="Je veux publier des logements"
                                  ? "Courtier/Propriétaire"
                                  : "Clients",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                          )
                        ],
                      ),
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
    );
  }
}
