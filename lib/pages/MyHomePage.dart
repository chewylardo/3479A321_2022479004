import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';


const  icon_1 = 'assets/icons/8666812_twitter_social_icon.svg';
const font_1 = 'miFuente';
var logger = Logger( printer: PrettyPrinter());

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  int _counter = 0;
 
  void _incrementCounter() {
    setState(() {
     
      _counter++;
    });
  }

   void _decrementCounter() {
    setState(() {
    
      _counter--;
    });
  }


   void _ResetCounter() {
    setState(() {
    
      _counter = 0;
    });
  }





  @override
  Widget build(BuildContext context) {
       logger.d('Home page widget build is working');
    
    final Widget svg = SvgPicture.asset(icon_1,semanticsLabel: 'Example SVG',  height: 128.0,  width: 128.0,  fit: BoxFit.contain );
    var scaffold6 = Scaffold(

     
      appBar: AppBar(

        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
     
        title: Text(widget.title),
      ),
      body: Center(
     
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            svg,
            const Text(
              'has apretado el boton esta cantidad de veces:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
   
      floatingActionButton: FloatingActionButton(
        onPressed: _ResetCounter,
        tooltip: 'Reset',
        child: const Icon(Icons.autorenew),
      ), 
     
      persistentFooterButtons: <Widget>[
        TextButton(
          onPressed: () {
           
            _decrementCounter();
          },
          child: const Icon(Icons.exposure_neg_1),
        ),
        TextButton(
         onPressed: () {
           _incrementCounter();
        },
        child: const Icon(Icons.exposure_plus_1),
    ),
  ],
   
      
   
    );
    var scaffold5 = scaffold6;
    var scaffold4 = scaffold5;
    var scaffold3 = scaffold4;
    var scaffold2 = scaffold3;
    var scaffold = scaffold2;
    return scaffold;
  }

  
}
