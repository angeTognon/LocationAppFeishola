import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:location_app/accueil.dart';
import 'package:location_app/splash.dart';
import 'package:location_app/onBoarding.dart';
import 'package:location_app/resultat.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

bool isFirstRun = false;
bool isFirstCall = false;

String currentUserId = "";
bool eya = false;
String currentUserEmail = "";
String userName = "";
String imagPath = "";
String user_email = "";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isConnected = prefs.getBool('isConnected') ?? false;

  final userPref = await SharedPreferences.getInstance();
  user_email = userPref.getString('email') ?? "";

  print("ds"+user_email);
  eya = isConnected;
  // await Firebase.initializeApp();
  runApp(Phoenix(child: MyApp(isConnected: isConnected)));
}

class MyApp extends StatefulWidget {
  final isConnected;
  MyApp({required this.isConnected});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _checkFirstRun() async {
    bool ifr = await IsFirstRun.isFirstRun();
    setState(() {
      isFirstRun = ifr;
    });
  }

  void _checkFirstCall() async {
    bool ifc = await IsFirstRun.isFirstCall();
    setState(() {
      isFirstCall = ifc;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _checkFirstRun();
    _checkFirstCall();
    print(isFirstCall);
    print(isFirstRun);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white), // Définir la couleur de l'icône de la barre d'applications
            ),
            primaryColor: const Color(0xFF202328),
            backgroundColor: const Color(0xFF121710)),
        // home: eya?Accueil():  OnBoarding()
        home: isFirstCall
            ? OnBoarding()
            :Splash() /* ), */
        );
  }
}
