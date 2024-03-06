import 'package:flutter/material.dart';
import 'package:location_app/wid.dart';

class Resultat extends StatefulWidget {
  const Resultat({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAB(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            h(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Résultats de recherche",
                  style: TextStyle(fontFamily: 'normal', fontSize: 16),
                ),
              ],
            ),
            Image.asset("assets/images/x9.png"),
            Container(margin: EdgeInsets.only(left: 20,right: 20),
              child: Text(
                "Filtrer par",
                style: TextStyle(fontFamily: 'normal', fontSize: 15),
              ),
            ),
            h(15),
            Container(margin: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Prix",
                    style: TextStyle(fontFamily: 'normal2', fontSize: 15),
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
            Container(margin: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ville",
                    style: TextStyle(fontFamily: 'normal2', fontSize: 15),
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
            h(20),
            Box2(context,"assets/images/x4.png", "Appartement meublé","Publiée le 1 Mars 2024", "20.000F/mois"),
            h(20),
            Box2(context,"assets/images/x1.png", "Appartement meublé","Publiée le 1 Mars 2024", "20.000F/mois"),
            h(20),
            Box2(context,"assets/images/x2.png", "Appartement meublé","Publiée le 1 Mars 2024", "20.000F/mois"),
            h(50)
          ],
        ),
      ),
    );
  }
}
