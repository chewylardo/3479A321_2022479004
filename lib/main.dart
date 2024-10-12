import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
//import 'package:logger/logger.dart';
import 'pages/MyHomePage.dart';
import 'AppData.dart';




const  icon_1 = 'assets/icons/8666812_twitter_social_icon.svg';
const font_1 = 'miFuente';
//var logger = Logger( printer: PrettyPrinter());


void main() {
  runApp(
      ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      child: MyApp(),
      ),
   );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
     //logger.d('Logger is working');
    return MaterialApp(
      title: 'flutter chewy',
      
      theme: ThemeData(
        
      
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: font_1), 
          bodyMedium: TextStyle(fontFamily: font_1),
          bodySmall: TextStyle(fontFamily: font_1),
          headlineLarge: TextStyle(fontFamily: font_1, fontSize: 32),
          headlineMedium: TextStyle(fontFamily: font_1, fontSize: 24),
      
        ),
         
      
         
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'flutter chewy'),
      //runApp(const CardExampleApp());
      //home: const CardExampleApp(),
    );
  }
}

