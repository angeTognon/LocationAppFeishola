import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location_app/wid.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Details extends StatefulWidget {
  String imgPath = "";
  String type = "";
  String ville = "";
  int id = 0;
  Details({required this.imgPath, required this.type, required this.id});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  double fraisVisite =0;
  double fraisContact =0;

  bool dataDisplayed = false;
  result() async {
    print("coucou");
    print(widget.id);
    var url =
        "https://agk007s.000webhostapp.com/comeup_location/getDetail.php?id=${widget.id}";
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response.body);
    var pub = await json.decode(response.body);
    return pub;
  }

  String dateRdv="";
  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
      
    }
    String heureRdv="";
    TimeOfDay selectedTime = TimeOfDay.now();
    _selectTime(BuildContext context) async {
      final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildCongcontext, child) {
          return MediaQuery(
            child: child ?? Container(),
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          );
        },
        initialEntryMode: TimePickerEntryMode.dial,
      );
      if (timeOfDay != null && timeOfDay != selectedTime) {
        setState(() {
          selectedTime = timeOfDay;
          heureRdv =
              "${selectedTime.hour}h${selectedTime.minute}"; //selectedTime.format(context).toString();
          print(heureRdv);
        });
      }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MAB(context),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: result(),
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
                        padding: EdgeInsets.all(20),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          dataDisplayed = true;
                        fraisVisite=  double.parse(snapshot.data![index]['prix'])*0.02;
                        fraisContact=  double.parse(snapshot.data![index]['prix'])*0.01;
                        print(fraisVisite);
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.other_houses_sharp,
                                        size: 40,
                                        color: mainColor,
                                      ),
                                      Container(
                                        width: 120,
                                        child: Text(
                                          widget.type,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'normal2'),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                  /*  */
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.check,
                                        size: 40,
                                        color: Color.fromARGB(255, 21, 192, 30),
                                      ),
                                      Container(
                                        width: 120,
                                        child: Text(
                                          "Disponible\n",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'normal2'),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                  /*  */
                                ],
                              ),
                              h(10),
                              Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${snapshot.data![index]['linkss']}"),
                                        fit: BoxFit.cover)),
                              ),
                              h(20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                      w(8),
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                      w(8),
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      )
                                    ],
                                  ),
                                  w(8),

                                ],
                              ),
                              h(20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Détails",
                                    style: TextStyle(
                                        fontFamily: 'normal', fontSize: 20),
                                  ),
                                ],
                              ),
                              h(15),
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Prix : ",
                                          style: TextStyle(
                                              fontFamily: 'normal2',
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "${snapshot.data![index]['prix']}",
                                          style: TextStyle(
                                              fontFamily: 'normal2',color: Colors.orange,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    h(15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Pays : ",
                                          style: TextStyle(
                                              fontFamily: 'normal2',
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "Sénégal",
                                          style: TextStyle(
                                              fontFamily: 'normal2',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    h(15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Ville : ",
                                          style: TextStyle(
                                              fontFamily: 'normal2',
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "${snapshot.data![index]['ville']}",
                                          style: TextStyle(
                                              fontFamily: 'normal2',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    h(15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Quartier : ",
                                          style: TextStyle(
                                              fontFamily: 'normal2',
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "${snapshot.data![index]['quartier']}",
                                          style: TextStyle(
                                              fontFamily: 'normal2',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    h(10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Description : ",
                                              style: TextStyle(
                                                  fontFamily: 'normal2',
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              "${snapshot.data![index]['descriptionn']}",
                                              style: TextStyle(
                                                  fontFamily: 'normal2',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    h(10),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: 14, right: 14),
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 230, 230, 230),
                                            borderRadius:
                                                BorderRadius.circular(11)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Douche Interne ?",
                                              style: TextStyle(
                                                  fontFamily: 'normal2', fontSize: 18),
                                            ),
                                            Text(
                                              "${snapshot.data![index]['doucheInterne']}",
                                              style: TextStyle(
                                                  fontFamily: 'normal2',fontWeight: FontWeight.w600,
                                                  color: Colors.red, fontSize: 16),
                                            ),
                                          ],
                                        )),
                                    h(10),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: 14, right: 14),
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 230, 230, 230),
                                            borderRadius:
                                                BorderRadius.circular(11)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Collocation disponible ?",
                                              style: TextStyle(
                                                  fontFamily: 'normal2', fontSize: 18),
                                            ),
                                            Text(
                                              "${snapshot.data![index]['collocationDispo']}",
                                              style: TextStyle(
                                                  fontFamily: 'normal2',fontWeight: FontWeight.w600,
                                                  color: Colors.red ,fontSize: 16),
                                            ),
                                          ],
                                        )),
                                    h(15),
                                    Text(
                                      "Offres",
                                      style: TextStyle(
                                          fontFamily: 'normal', fontSize: 20),
                                    ),
                                    
                                    h(15),
                                    InkWell(
                                      onTap: () {
                                        showDialog(context: context, builder: (context) => StatefulBuilder(
                                          builder: (context, setState) => AlertDialog(
                                            actions: [
                                               ElevatedButton(style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 79, 152, 255)),onPressed: (){
                                                Navigator.pop(context);
                                              }, child: Text("Fermer")),
                                              ElevatedButton(style: ElevatedButton.styleFrom(primary: mainColor),onPressed: (){
                                                Navigator.pop(context);
                                                showDialog(context: context, builder: (context) => AlertDialog(
                                                  actions: [
                                                    ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Fermer"))
                                                  ],
                                                  content: Container(
                                                    height: 200,width: 200,
                                                    child: Column(
                                                      children: [
                                                        Icon(Icons.check_circle_outline,size: 140,color: Color.fromARGB(255, 2, 135, 40),),
                                                        Text("Prise de Rendez-vous Validé",style: TextStyle(
                                                          fontFamily: 'normal2',
                                                          fontSize: 16
                                                        ),textAlign: TextAlign.center  ,)
                                                      ],
                                                    ),
                                                  ),
                                                ),);
                                              }, child: Text("Valider")),
                                            ],
                                            title: Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Formulaire de RDV"),
                                              ],
                                            ),
                                            content: Container(
                                              height: 300,width: 300,
                                              decoration: BoxDecoration(

                                              ),
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("Date de Rendez-vous : "),
                                                      ElevatedButton(style: ElevatedButton.styleFrom(primary: mainColor),onPressed: ()async{
                                                        final DateTime? selected = await showDatePicker(
                                                        context: context,
                                                        initialDate: selectedDate,
                                                        firstDate: DateTime(2010),
                                                        lastDate: DateTime(2025),
                                                      );
                                                       
                                                      if (selected != null && selected != selectedDate) {
                                                        setState(() {
                                                          selectedDate = selected;
                                                          dateRdv =
                                                              "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                                                          print(dateRdv);
                                                        });
                                                      }
                                                      }, child: Text("Choisir",style: TextStyle(color: Colors.white)))
                                                    ],
                                                  ),
                                                  Text(dateRdv,style: TextStyle(fontFamily: 'normal'),),
                                                  h(5),

                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("Heure de Rendez-vous : "),
                                                      ElevatedButton(style: ElevatedButton.styleFrom(primary: mainColor),onPressed: ()async{
                                                        final TimeOfDay? timeOfDay = await showTimePicker(
                                                          context: context,
                                                          initialTime: selectedTime,
                                                          builder: (BuildCongcontext, child) {
                                                            return MediaQuery(
                                                              child: child ?? Container(),
                                                              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                                            );
                                                          },
                                                          initialEntryMode: TimePickerEntryMode.dial,
                                                        );
                                                        setState((){
                                                          if (timeOfDay != null && timeOfDay != selectedTime) {
                                                          setState(() {
                                                            selectedTime = timeOfDay;
                                                            heureRdv =
                                                                "${selectedTime.hour}h${selectedTime.minute}"; //selectedTime.format(context).toString();
                                                            print(heureRdv);
                                                          });
                                                        }
                                                        });
                                                        
                                                      }, child: Text("Choisir",style: TextStyle(color: Colors.white)))
                                                    ],
                                                  ),
                                                  Text(heureRdv,style: TextStyle(fontFamily: 'normal'),),
                                                  h(5),
                                                  Text(
                                                      "Votre ville actuelle",
                                                      style: TextStyle(fontSize: 14, fontFamily: 'normal'),
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
                                                          // controller: quartierController,
                                                          decoration: InputDecoration.collapsed(
                                                              hintText: "Ex : Dakar",
                                                              hintStyle: TextStyle(
                                                                  fontSize: 15, fontWeight: FontWeight.bold)),
                                                        ),
                                                      ),
                                                    ),
                                                    h(15),
                                                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                       children: [
                                                         Text("Frais de visite à prévoir : ",
                                                          style: TextStyle(fontSize: 14, fontFamily: 'normal'),),

                                                          Text("$fraisVisite FCFA  ",
                                                          style: TextStyle(fontSize: 14, fontFamily: 'normal',color: mainColor),),
                                                       ],
                                                     ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: 14, right: 14),
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 230, 230, 230),
                                              borderRadius:
                                                  BorderRadius.circular(11)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "1.",
                                                style: TextStyle(
                                                    fontFamily: 'normal',
                                                    fontSize: 19),
                                              ),
                                              Text(
                                                "Planifier un rendez-vous",
                                                style: TextStyle(
                                                  fontFamily: 'normal2',
                                                ),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Center(
                                                  child: Icon(Icons.arrow_forward_ios_sharp),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    h(15),
                                    InkWell(
                                      onTap: () {
                                        showDialog(context: context, builder: (context) => AlertDialog(
                                          actions: [
                                             ElevatedButton(style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 79, 152, 255)),onPressed: (){
                                                Navigator.pop(context);
                                              }, child: Text("Fermer",)),
                                               ElevatedButton(style: ElevatedButton.styleFrom(primary: mainColor),onPressed: (){
                                                // Navigator.pop(context);
                                              }, child: Text("Payer")),
                                          ],
                                          content: Container(
                                            height: 150,width: 150,
                                            child: Column(
                                              children: [
                                                Text("Pour avoir le numéro du propriétaire et le contacter, vous devez payer 1% du montant du logement, soit :",textAlign: TextAlign.justify,),
                                                h(20),
                                                Text(" $fraisContact FCFA",style: TextStyle(
                                                  fontFamily:'normal' 
                                                ),),
                                              ],
                                            ),
                                          ),
                                        ),);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: 14, right: 14),
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(11)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "2.",
                                                style: TextStyle(
                                                    fontFamily: 'normal',color: Colors.white,
                                                    fontSize: 19),
                                              ),
                                              Text(
                                                "Contacter le propriétaire",
                                                style: TextStyle(
                                                  fontFamily: 'normal2',color: Colors.white
                                                ),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Center(
                                                  child: Icon(Icons.arrow_forward_ios_sharp),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
              }
              return Center(
                  child: Container(
                      height: 150,
                      width: 150,
                      child: Lottie.asset("assets/images/auto_loading.json")));
            },
          ),
        )

        /* SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
          ],
        ),
      ), */
        );
  }
}
