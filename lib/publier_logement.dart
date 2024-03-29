import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location_app/accueil.dart';
import 'package:location_app/connexion.dart';
import 'package:country_picker/country_picker.dart';
import 'package:location_app/main.dart';
import 'package:location_app/wid.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Publier extends StatefulWidget {
  const Publier({super.key});

  @override
  State<Publier> createState() => _PublierState();
}

class _PublierState extends State<Publier> {
  final publierController = TextEditingController();
  final prixController = TextEditingController();
  String Pays = "";
  final villeController = TextEditingController();
  final quartierController = TextEditingController();
  final descriptionController = TextEditingController();
  String doucheInterne = "";
  String collocation = "";

  bool doucheInterneOui = false;
  bool doucheInterneNon = false;
  bool collocationOui = false;
  bool collocationNon = false;

  bool show = false;

  String dropdownvalue = 'Cliquez ici';

  // List of items in our dropdown menu
  var items = [
    'Cliquez ici',
    'Studio',
    'Mini Studio',
    'Appartement',
    'Chambre Simple',
    'Chambre Toilette',
    'Chambre Cuisine',
    'Chambre Meublée',
    'Maison'
  ];

  String dropdownvalueVille = 'Cliquez ici';

  // List of items in our dropdown menu
  var itemsVille = [
    'Cliquez ici',
    'Dakar',
    'Saint Louis',
    'Touba',
    'Thiès',
    'Kaolack',
    'Ziguinchor',
    'Rufisque',
    'Mbour',
  ];

  File? image;
  var uploadimage;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      uploadimage = File(image.path);
      setState(() => this.image = uploadimage);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  String base64String = "";

  Future<void> uploadImage() async {
    String uploadurl =
        "https://agk007s.000webhostapp.com/comeup_location/article_image_upload.php";

    Uint8List _bytes = await uploadimage.readAsBytes();

    String _base64String = base64.encode(_bytes);
    setState(() {
      base64String = _base64String;
      print(base64String);
    });

    var response = await http.post(Uri.parse(uploadurl), body: {
      'image': base64String,
      'mail': "$dropdownvalue" + "$randomNumber"
    });
    if (response.statusCode == 200) {
      // print(response.body);
      var jsondata = json.decode(response.body);
      if (jsondata["error"]) {
        print(jsondata["msg"]);
      } else {
        print("Upload successful");
      }
    } else {
      print("Error during connection to server");
    }
  }

  String photoLink =
      "https://agk007s.000webhostapp.com/comeup_location/article/";
  String? temps;

  publier() async {
    setState(() {
      show = true;
    });
    var url =
        "https://agk007s.000webhostapp.com/comeup_location/publier.php?titre=$dropdownvalue&prix=${prixController.text}&pays=sen&ville=$dropdownvalueVille&quartier=${quartierController.text}&disponible=Oui&descriptionn=${descriptionController.text}&doucheInterne=$doucheInterne&collocationDispo=$collocation&mailss=$user_email&linkss=$photoLink$dropdownvalue$randomNumber${".jpg"}&temps=$temps";
    var response = await http.post(Uri.parse(url));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.body == "OK") {
      setState(() {
        show = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 18, 133, 22),
          content: Text(
            "Publication Réussie",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )));
      uploadImage();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Accueil(),
          ));
    } else {
      setState(() {
        print(response.body);
        show = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Erreur : Réessayez svp",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )));
      });
    }
  }

  Random random = new Random();
  int? randomNumber;

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
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("assets/images/publier.png"),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
              h(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Publier un logement",
                    style: TextStyle(fontSize: 22, fontFamily: 'normal'),
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
                "Que voulez-vous publier ?",
                style: TextStyle(fontSize: 18, fontFamily: 'normal'),
              ),
              h(10),
              Container(
                padding: EdgeInsets.only(left: 20, top: 13),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: DropdownButton(
                  value: dropdownvalue,
                  isDense: true,
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
              ),
              /*  */
              h(20),
              Text(
                "Prix du logement",
                style: TextStyle(fontSize: 18, fontFamily: 'normal'),
              ),
              h(10),
              Container(
                padding: EdgeInsets.only(left: 20, top: 15),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Container(
                  height: 50,
                  width: 230,
                  child: TextFormField(
                    controller: prixController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration.collapsed(
                        hintText: "Ex : 50000",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              /*  */
              h(10),
              Text(
                "Pays",
                style: TextStyle(fontSize: 18, fontFamily: 'normal'),
              ),
              h(10),
              Container(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 255, 255)),
                  child: Text(
                    "Sénégal",
                    style: TextStyle(fontFamily: 'normal'),
                  )),
              h(10),
              /*  */
              Text(
                "Ville",
                style: TextStyle(fontSize: 18, fontFamily: 'normal'),
              ),
              h(10),
              Container(
                padding: EdgeInsets.only(left: 20, top: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: DropdownButton(
                  value: dropdownvalueVille,
                  isDense: true,
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
              ),
              h(10),
              /*  */
              Text(
                "Quartier",
                style: TextStyle(fontSize: 18, fontFamily: 'normal'),
              ),
              h(10),
              Container(
                padding: EdgeInsets.only(left: 20, top: 15),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Container(
                  height: 50,
                  width: 230,
                  child: TextFormField(
                    controller: quartierController,
                    decoration: InputDecoration.collapsed(
                        hintText: "Ex : Grand Yoff",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(10),
              Text(
                "Petite Description de la location",
                style: TextStyle(fontSize: 18, fontFamily: 'normal'),
              ),
              h(10),
              Container(
                padding: EdgeInsets.only(left: 10, top: 0),
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Container(
                  height: 150,
                  width: 200,
                  margin: EdgeInsets.only(top: 16, left: 5),
                  child: TextFormField(
                    maxLines: 10,
                    controller: descriptionController,
                    decoration: InputDecoration.collapsed(
                        hintText:
                            "Décrivez par exemple l'emplacement\ndu logement, ses caractéristiques clées...",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(15),
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
              h(10),
              Text(
                "Votre logement possède une douche interne ou externe  ?",
                style: TextStyle(fontSize: 18, fontFamily: 'normal'),
              ),
              h(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        doucheInterneOui = true;
                        doucheInterneNon = false;
                        doucheInterne = "Oui";
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          doucheInterneOui
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color:
                              doucheInterneOui ? Colors.orange : Colors.black,
                        ),
                        w(20),
                        Text(
                          "Interne",
                          style: TextStyle(fontFamily: 'normal2'),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        doucheInterneNon = true;
                        doucheInterneOui = false;
                        doucheInterne = "Non";
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          doucheInterneNon
                              ? Icons.circle
                              : Icons.circle_outlined,
                          color:
                              doucheInterneNon ? Colors.orange : Colors.black,
                        ),
                        w(20),
                        Text(
                          "Externe",
                          style: TextStyle(fontFamily: 'normal2'),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              /*  */

              h(10),
              Text(
                "Peut on faire une collocation dans votre logement ?",
                style: TextStyle(fontSize: 18, fontFamily: 'normal'),
              ),
              h(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        collocationOui = true;
                        collocationNon = false;
                        collocation = "Oui";
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          collocationOui ? Icons.circle : Icons.circle_outlined,
                          color: collocationOui ? Colors.orange : Colors.black,
                        ),
                        w(20),
                        Text(
                          "Oui",
                          style: TextStyle(fontFamily: 'normal2'),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        collocationNon = true;
                        collocationOui = false;
                        collocation = "Non";
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          collocationNon ? Icons.circle : Icons.circle_outlined,
                          color: collocationNon ? Colors.orange : Colors.black,
                        ),
                        w(20),
                        Text(
                          "Non",
                          style: TextStyle(fontFamily: 'normal2'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              h(10),
              Text(
                "Importez une photo du logement\n(PHOTO n°1)",
                style: TextStyle(fontSize: 18, fontFamily: 'normal'),
              ),
              h(15),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: Colors.black38)),
                child: InkWell(
                  onTap: () {
                    pickImage();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ajouter une photo claire"),
                      Icon(Icons.photo)
                    ],
                  ),
                ),
              ),
              h(20),
              Container(
                  //show image here after choosing image
                  child: uploadimage == null
                      ? Container()
                      : //if uploadimage is null then show empty container
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                //elese show image here
                                child: SizedBox(
                                    height: 150,
                                    child: Image.file(
                                        uploadimage!) //load image from file
                                    )),
                          ],
                        )),
              h(10),
              h(20),
              show
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    )
                  : InkWell(
                      onTap: () {
                        // uploadImage();
                        if (dropdownvalue == "" ||
                            prixController.text == "" ||
                            dropdownvalueVille == "" ||
                            quartierController.text == "" ||
                            descriptionController.text == "" ||
                            doucheInterne == "" ||
                            collocation == "" ||
                            uploadimage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "Veuillez remplir tous les champs !",
                              style: TextStyle(
                                  fontFamily: 'normal', color: Colors.white),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 147, 36, 28),
                          ));
                        } else {
                          setState(() {
                            randomNumber = random.nextInt(100000);
                            print(
                                "Generated Random Number Between 0 to 9: $randomNumber");
                            temps = DateFormat('M/d/y').format(DateTime.now());
                          });
                          publier();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            "Publier",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'normal2',
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ));
  }
}
