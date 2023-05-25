import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/_core/myColor.dart';
import 'package:firebase_project/firestore/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection("Só para testar").doc("Estou testando").set({
    "Funcionou?": true,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "'Lista de Compras",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MyColors.brown,
        scaffoldBackgroundColor: MyColors.greenlight[300],
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: MyColors.brownAccent,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: MyColors.green,
        ),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 70,
          centerTitle: true,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
