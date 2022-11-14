import 'dart:async';
import 'package:contact_book/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AddContactpage.dart';
import 'EditPage.dart';
import 'card.dart';
import 'detailpage.dart';
import 'login.dart';
import 'modals/modal.dart';
import 'package:url_launcher/url_launcher.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


// void main() async {
// /*await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
//   DeviceOrientation.portraitUp,
//   DeviceOrientation.landscapeLeft,
//   DeviceOrientation.landscapeRight,
//   DeviceOrientation.portraitDown,
// ]);*/
//   runApp(
//     MyApp(),
//   );
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

bool isDark = false;
final ThemeData lighttheme = ThemeData(
  primaryColor: Colors.green,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
    iconTheme: IconThemeData(color: Colors.black),
  ),
);
final ThemeData darktheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
    iconTheme: IconThemeData(color: Colors.white),
  ),
);

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (val) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // home: Login(),
      debugShowCheckedModeBanner: false,
      theme: lighttheme,
      darkTheme: darktheme,
      themeMode: (isDark == true) ? ThemeMode.dark : ThemeMode.light,

      routes: {
        "/": (context) => Login(),
          "homepage": (context) => const HomePage(),
        "addcontactpage": (context) => const AddContactPage(),
        "detailpage": (context) => const DetailPage(),
        "editpage": (context) => const EditPage(),
      },
    );
  }
}


