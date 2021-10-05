import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:path_provider/path_provider.dart';
import 'package:untitled2/views/HomeScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final applicationDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(applicationDocumentDir.path);
  await Hive.openBox("noteBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset("assets/images/logo.png",height: 80,),
        splashIconSize: double.maxFinite,
        duration: 3000,

        splashTransition: SplashTransition.fadeTransition,
         nextScreen: Home()
      ),
    );
  }
}


