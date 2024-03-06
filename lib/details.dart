import 'package:flutter/material.dart';
import 'package:location_app/wid.dart';

class Details extends StatefulWidget {
  String imgPath = "";
  String type = "";
  String ville = "";
  Details({required this.imgPath, required this.type});
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAB(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        style: TextStyle(fontSize: 14, fontFamily: 'normal2'),
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
                        style: TextStyle(fontSize: 14, fontFamily: 'normal2'),
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
                  image: DecorationImage(
                      image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
            ),
            h(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_ios),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    w(8),
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    w(8),
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(25)),
                    )
                  ],
                ),
                w(8),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            h(15),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Description",
                  style: TextStyle(fontFamily: 'normal', fontSize: 15),
                ),
              ],
            ),
            h(15),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pays : ",
                  style: TextStyle(fontFamily: 'normal2', fontSize: 15),
                ),
                 Text(
                  "Sénégal",
                  style: TextStyle(fontFamily: 'normal2',fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),

            h(15),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ville : ",
                  style: TextStyle(fontFamily: 'normal2', fontSize: 15),
                ),
                 Text(
                  "Dakar",
                  style: TextStyle(fontFamily: 'normal2',fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),

            h(15),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quartier : ",
                  style: TextStyle(fontFamily: 'normal2', fontSize: 15),
                ),
                 Text(
                  "Sacré coeur",
                  style: TextStyle(fontFamily: 'normal2',fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            h(10),
            Container(
              padding: EdgeInsets.only(left: 14,right: 14),
              height: 40,width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.circular(11)
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Staff disponible ?",style: TextStyle(fontFamily: 'normal2'),),
                  Text("NON",style: TextStyle(fontFamily: 'normal2',color: Colors.red),),
                ],
              )
            ),
            h(10),
            Container(
              padding: EdgeInsets.only(left: 14,right: 14),
              height: 40,width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.circular(11)
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Collocation disponible ?",style: TextStyle(fontFamily: 'normal2'),),
                  Text("NON",style: TextStyle(fontFamily: 'normal2',color: Colors.red),),
                ],
              )
            ),
            h(10),
            Container(
              padding: EdgeInsets.only(left: 14,right: 14),
              height: 40,width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.circular(11)
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Douche Interne ?",style: TextStyle(fontFamily: 'normal2'),),
                  Text("OUI",style: TextStyle(fontFamily: 'normal2',color: Colors.red),),
                ],
              )
            ),
            h(20),
            Text("Offres",style: TextStyle(fontFamily: 'normal',fontSize: 16),),
            h(15),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                padding: EdgeInsets.only(left: 14,right: 14),
                height: 50,width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.circular(11)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("1.",style: TextStyle(fontFamily: 'normal',fontSize: 19),),
                    Text("VIsiter la propriété en ligne",style: TextStyle(fontFamily: 'normal2',),),
                    Container(
                      height: 30,width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Icon(Icons.play_arrow),
                      ),
                    )
                  ],
                )
              ),
            ),

            h(15),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                padding: EdgeInsets.only(left: 14,right: 14),
                height: 50,width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.circular(11)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("2.",style: TextStyle(fontFamily: 'normal',fontSize: 19),),
                    Text("Planifier un rendez-vous",style: TextStyle(fontFamily: 'normal2',),),
                    Container(
                      height: 30,width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Icon(Icons.play_arrow),
                      ),
                    )
                  ],
                )
              ),
            ),
            h(15),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                padding: EdgeInsets.only(left: 14,right: 14),
                height: 50,width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.circular(11)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("3.",style: TextStyle(fontFamily: 'normal',fontSize: 19),),
                    Text("Contacter le propriétaire",style: TextStyle(fontFamily: 'normal2',),),
                    Container(
                      height: 30,width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Icon(Icons.play_arrow),
                      ),
                    )
                  ],
                )
              ),
              
            ),
            h(15),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                padding: EdgeInsets.only(left: 14,right: 14),
                height: 50,width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(11)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("4.",style: TextStyle(fontFamily: 'normal',fontSize: 19,color: Colors.white),),
                    Text("Confirmer une réservation et\neffectuer paiement",style: TextStyle(color: Colors.white,fontFamily: 'normal2',),),
                    Container(
                      height: 30,width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20) 
                      ),
                      child: Center(
                        child: Icon(Icons.play_arrow),
                      ),
                    )
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
