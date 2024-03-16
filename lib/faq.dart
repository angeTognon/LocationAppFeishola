import 'package:flutter/material.dart';
import 'package:location_app/wid.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
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
                Text("Foire Aux Questions",style: TextStyle(fontFamily: 'normal',fontSize: 22),),
              ],
            ),
            Image.asset("assets/images/faq.png"),
            h(15),
            Text("Q1. Comment fonctionne Guidi Immo ?",style: TextStyle(fontFamily: 'normal',fontSize: 16),),
            h(10),
            Text("R1. Guidi Immo est une application mobile conviviale conçue pour vous aider à rechercher et à trouver facilement des logements au Sénégal. Vous pouvez utiliser les filtres de recherche pour spécifier vos critères tels que le type de logement, la localisation, le prix, les commodités, etc. L'application affichera ensuite les listes de logements correspondantes à vos critères de recherche",style: TextStyle(fontFamily: 'normal2',),textAlign: TextAlign.justify,),
            
            h(15),
            Text("Q2. Comment puis-je télécharger Guidi Immo ?",style: TextStyle(fontFamily: 'normal',fontSize: 16),),
            h(10),
            Text("R2. Pour télécharger Guidi Immo, veuillez visiter le magasin d'applications de votre appareil ( Google Play Store pour les appareils Android) et recherchez 'Guidi Immo'. Cliquez sur le bouton de téléchargement et l'application sera installée sur votre appareil.",style: TextStyle(fontFamily: 'normal2',),textAlign: TextAlign.justify,),


            h(15),
            Text("Q3. Comment puis-je effectuer une recherche sur l'application ?",style: TextStyle(fontFamily: 'normal',fontSize: 16),),
            h(10),
            Text("R3. La recherche d'un logement sur l'application se fait de 2 manières : La première en utilisant la zone de recherche sur l'écran d'accueil et la deuxième manière en cliquant sur l'une des catégories de logement",style: TextStyle(fontFamily: 'normal2',),textAlign: TextAlign.justify,),

            h(15),
            Text("Q4. Puis-je contacter directement les propriétaires des logements ?",style: TextStyle(fontFamily: 'normal',fontSize: 16),),
            h(10),
            Text("R4.Avant de contacter le propriétaire d'un logement ou un courtier, il est nécessaire de payer 1% du montant du logement. Une fois le paiement effectué, vous avez accès au numéro de téléphone de prestataire, ainsi que son nom et prénom.",style: TextStyle(fontFamily: 'normal2',),textAlign: TextAlign.justify,),

            h(15),
            Text("Q5. Comment puis-je signaler une annonce frauduleuse ou inappropriée ?",style: TextStyle(fontFamily: 'normal',fontSize: 16),),
            h(10),
            Text("R5. Si vous rencontrez une annonce frauduleuse ou inappropriée sur Guidi Immo, nous vous encourageons à nous en informer immédiatement. Vous pouvez utiliser la fonction de signalement disponible dans l'application pour nous faire part de vos préoccupations. Nous prendrons les mesures nécessaires pour enquêter sur le problème et prendre les mesures appropriées.",style: TextStyle(fontFamily: 'normal2',),textAlign: TextAlign.justify,),

            h(15),
            Text("Q6. Que signifie Mo GEUNEU ?",style: TextStyle(fontFamily: 'normal',fontSize: 16),),
            h(10),
            Text("R6. C'est un mot Wolof qui veut dire dans notre contexte les meilleurs offres ou bien au top",style: TextStyle(fontFamily: 'normal2',),textAlign: TextAlign.justify,),

          ],
        ),
      ),
    );
  }
}