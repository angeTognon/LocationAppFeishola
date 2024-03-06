import 'package:flutter/material.dart';
import 'package:location_app/accueil.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(
      seconds: 7
    ),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Accueil(),)),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Container(height: 50,width: 50,
        child: Center(
          child: Image.asset("assets/images/logo.png",scale: 2,),
        ),
      ),
    );
  }
}