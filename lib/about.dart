import 'package:flutter/material.dart';
import 'package:location_app/wid.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAB(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("A propos de nous",style: TextStyle(fontFamily: 'normal',fontSize: 22),),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/about.png",scale: 2,),
              ],
            ),
           
            h(10),
            Text("Guidi Immo est une application mobile innovante conçue pour simplifier la recherche de logements au Sénégal. Que vous cherchiez une chambre, un appartement, un studio ou un mini-studio, Guidi Immo vous offre une plateforme conviviale pour trouver rapidement et facilement votre prochain chez-vous.",style: TextStyle(fontFamily: 'normal2',),textAlign: TextAlign.justify,),
            h(15),
            Text("Notre mission est de faciliter la recherche de logements en mettant en relation les locataires potentiels avec les propriétaires et les agences immobilières de confiance. Nous comprenons les défis et les frustrations associés à la recherche de logements, c'est pourquoi nous nous efforçons de rendre ce processus aussi simple et efficace que possible.",style: TextStyle(fontFamily: 'normal2',),textAlign: TextAlign.justify,),

 h(15),
            Text("Fonctionnalités principales de Guidi Immo :",style: TextStyle(fontFamily: 'normal',fontSize: 16),textAlign: TextAlign.justify,),

 h(15),
            Text("1- Recherche avancée : Parcourez une vaste sélection d'annonces de logements au Sénégal et filtrez les résultats en fonction de vos critères spécifiques tels que l'emplacement, le type de logement, le prix, le nombre de chambres, etc..",style: TextStyle(fontFamily: 'normal2',),textAlign: TextAlign.justify,),

 h(15),
            Text("2- Détails complets des logements : Consultez les détails complets de chaque logement, y compris les descriptions, les photos, les caractéristiques, les commodités et les informations de contact du propriétaire ou de l'agence immobilière. .",style: TextStyle(fontFamily: 'normal2',),textAlign: TextAlign.justify,),

 h(15),
            Text("3- Signalement d'annonces : Signalez les annonces suspectes ou inappropriées pour nous aider à maintenir un environnement sûr et fiable pour tous les utilisateurs de Guidi Immo..",style: TextStyle(fontFamily: 'normal2',),textAlign: TextAlign.justify,),

          ],
        ),
      ),
    );
  }
}

/* */