import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foxton_steemy_admin_pannel/Pages/home_page.dart';
import 'package:foxton_steemy_admin_pannel/Pages/landing_page.dart';
import 'package:foxton_steemy_admin_pannel/Pages/login_page.dart';
import 'package:foxton_steemy_admin_pannel/Pages/product_upload_screen.dart';
import 'package:foxton_steemy_admin_pannel/Pages/sell_screen.dart';

import 'firebase_options.dart';
void main()async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
