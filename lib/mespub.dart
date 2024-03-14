import 'package:flutter/material.dart';
import 'package:location_app/wid.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class MesPubs extends StatefulWidget {
  const MesPubs({super.key});

  @override
  State<MesPubs> createState() => _MesPubsState();
}

class _MesPubsState extends State<MesPubs> {
  delete(String id) async {
    var url =
        "https://agk007s.000webhostapp.com/comeup_location/delete.php?id=$id";
    var response = await http.post(Uri.parse(url));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.body == "OK") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 18, 133, 22),
          content: Text(
            "Suppression Réussie",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )));
      Navigator.push(context, MaterialPageRoute(builder: (context) => MesPubs(),));
    } else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Erreur de suppresion. ",
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
        body: Container(
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: mesPubs(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Erreur de chargement. Veuillez relancer l'application"),
                );
              }
              if (snapshot.hasData) {
                return Container(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return BoxMesPubs(snapshot.data![index]['linkss'], index,
                          snapshot.data![index]['id']);
                    },
                  ),
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
        ));
  }

  BoxMesPubs(String path, int number, id) {
    return Wrap(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(path), fit: BoxFit.cover)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 150, 31, 22)),
                      onPressed: () {
                        delete(id);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
