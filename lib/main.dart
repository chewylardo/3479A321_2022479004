import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'pages/MyHomePage.dart';




const  icon_1 = 'assets/icons/8666812_twitter_social_icon.svg';
const font_1 = 'miFuente';
var logger = Logger( printer: PrettyPrinter());


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     logger.d('Logger is working');
    return MaterialApp(
      title: 'flutter chewy',
      
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
      
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

