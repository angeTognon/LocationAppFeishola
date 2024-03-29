import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location_app/connexion.dart';
import 'package:country_picker/country_picker.dart';
import 'package:location_app/wid.dart';
import 'package:http/http.dart' as http;

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final nomPrenomController = TextEditingController();
  final paysController = TextEditingController();
  final numController = TextEditingController();
  final emailController = TextEditingController();
  final mpController = TextEditingController();

  bool isClicked1 = false;
  bool isClicked2 = false;
  bool hide = true;
  String typeCompte = "";
  String Pays = "";
  String phoneCode = "";
  bool show = false;

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
        "https://agk007s.000webhostapp.com/comeup_location/image_upload.php";

    Uint8List _bytes = await uploadimage.readAsBytes();

    String _base64String = base64.encode(_bytes);
    setState(() {
      base64String = _base64String;
      print(base64String);
    });

    var response = await http.post(Uri.parse(uploadurl),
        body: {'image': base64String, 'mail': emailController.text});
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

  inscription() async {
    setState(() {
      show = true;
    });
    // EncryptData(mpController.text);
    var url =
        "https://agk007s.000webhostapp.com/comeup_location/inscription.php?nomPrenoms=${nomPrenomController.text}&pays=$Pays&num=${numController.text}&email=${emailController.text}&typeCompte=$typeCompte&photo=ff&mp=${mpController.text}";
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
            "Inscription Réussie",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )));
      uploadImage();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Connexion(),
          ),
          (route) => false);
    } else {
      setState(() {
        show = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Erreur : Il semble que cette adresse mail a déjà été utilisée ",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )));
      });
    }
  }

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
                      height: 170,
                      width: 170,
                      child: Image.asset("assets/images/signup.png")),
                ],
              ),
              h(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Inscription",
                    style: TextStyle(fontSize: 22, fontFamily: 'normal'),
                  )
                ],
              ),
              h(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 136, 26, 88),
                        borderRadius: BorderRadius.circular(2)
                    ),

                    height: 4,
                    width: 90,
                  ),
                ],
              ),
              h(25),
              Text(
                "Nom & Prénoms",
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
                    controller: nomPrenomController,
                    decoration: InputDecoration.collapsed(
                        hintText: "Ex : John Doe",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(20),
              Text(
                "Pays Actuelle",
                style: TextStyle(fontSize: 16, fontFamily: 'normal'),
              ),
              h(10),
              Text(
                "Exemple : Senegal ou Benin",
                style: TextStyle(fontSize: 14, fontFamily: 'normal2'),
              ),
              h(10),
              InkWell(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    onSelect: (Country country) {
                      setState(() {
                        Pays = "${country.name}";
                        phoneCode = "${country.phoneCode}";
                      });
                      print('Select country: ${country.displayName}');
                    },
                  );
                },
                child: Container(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 255, 255, 255)),
                    child: Text(
                      Pays == "" ? "Cliquez ici pour choisir" : Pays,
                      style: TextStyle(fontFamily: 'normal'),
                    )),
              ),
              h(20),
              Text(
                "Numéro de téléphone",
                style: TextStyle(fontSize: 18, fontFamily: 'normal'),
              ),
              h(10),
              Container(
                padding: EdgeInsets.only(left: 10, top: 0),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: Center(
                            child: Text(
                          " + $phoneCode",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'normal',
                              color: mainColor),
                        ))),
                    Container(
                      height: 50,
                      width: 200,
                      margin: EdgeInsets.only(top: 16, left: 15),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: numController,
                        decoration: InputDecoration.collapsed(
                            hintText: "00000000",
                            hintStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              h(20),

              Text(
                "Email",
                style: TextStyle(fontSize: 18, fontFamily: 'normal'),
              ),
              h(15),
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
                    controller: emailController,
                    decoration: InputDecoration.collapsed(
                        hintText: "exemple@gmail.com",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(20),
              Text(
                "Type de compte",
                style: TextStyle(fontSize: 18, fontFamily: 'normal'),
              ),
              h(15),
              InkWell(
                onTap: () {
                  setState(() {
                    isClicked1 = true;
                    isClicked2 = false;
                    hide=true;
                    typeCompte = "Je cherche un logement";
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isClicked1 ? Icons.circle : Icons.circle_outlined,
                      color: isClicked1 ? Colors.orange : Colors.black,
                    ),
                    w(20),
                    Text(
                      "Je cherche un logement",
                      style: TextStyle(fontFamily: 'normal2'),
                    )
                  ],
                ),
              ),
              h(15),
              InkWell(
                onTap: () {
                  setState(() {
                    isClicked2 = true;
                    hide=false;
                    isClicked1 = false;
                    typeCompte = "Je veux publier des logements";
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isClicked2 ? Icons.circle : Icons.circle_outlined,
                      color: isClicked2 ? Colors.orange : Colors.black,
                    ),
                    w(20),
                    Text(
                      "Je veux publier des logements\nsur l'application",
                      style: TextStyle(fontFamily: 'normal2'),
                    )
                  ],
                ),
              ),
              h(10),
              hide
                  ? Text("")
                  : Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Importez la photo de votre pièce d'identité",
                          style: TextStyle(fontSize: 16, fontFamily: 'normal'),
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
                        h(20),
                      ],
                    ),
              Text(
                "Mot de passe",
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
                    controller: mpController,
                    obscureText: true,
                    decoration: InputDecoration.collapsed(
                        hintText: "*************",
                        hintStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              h(20),

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
                        if (nomPrenomController.text == "" ||
                            Pays == "" ||
                            numController.text == "" ||
                            emailController.text == "" ||
                            typeCompte == "" ||
                            uploadimage == null ||
                            mpController.text == "") {
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
                          inscription();
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
                            "M'inscrire",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'normal2',
                            ),
                          ),
                        ),
                      ),
                    ),
              h(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Vous avez déjà de compte ?",
                    style: TextStyle(fontFamily: 'normal2',fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Connexion()));
                    },
                    child: Text(
                      "Se connecter",
                      style: TextStyle(fontFamily: 'normal',fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
