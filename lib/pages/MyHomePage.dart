import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:logger/logger.dart';


String icon_1 = 'assets/icons/8665113_chess_icon.svg';
const font_1 = 'miFuente';
//var logger = Logger( printer: PrettyPrinter());



class auditor {

static List<String> Auditoria = <String>[];


  static String imprimir(){
    String elString = '';



      for(int i = 0;i<Auditoria.length;i++){

        elString = elString + Auditoria[i];





      }





    return elString;
  }

}



////////////////////////////////////////////////////////Home////////////////////////////////////////////////////////////////





class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    print('create home state');
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  _MyHomePageState() {
    print('constructor, mounted: $mounted');
  }

  @override
  void initState() {
    super.initState();
    print('initState, mounted: $mounted');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies, mounted: $mounted');
  }

  @override
  void setState(VoidCallback fn) {
    print('setState');
    super.setState(fn);
  }

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

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  late String icon_1;

  Widget _icono() {
    if (_counter == 10) {
      icon_1 = 'assets/icons/8665991_trophy_icon.svg';
    } else if (_counter == 5) {
      icon_1 = 'assets/icons/8665927_skull_death_icon.svg';
    } else {
      icon_1 = 'assets/icons/8665113_chess_icon.svg';
    }
    Widget svg = SvgPicture.asset(
      icon_1,
      semanticsLabel: 'Example SVG',
      height: 128.0,
      width: 128.0,
      fit: BoxFit.contain,
    );

    return svg;
  }

  String _text() {
    String texto = '';
    if (_counter == 10) {
      texto = 'VICTORIA';
    } else if (_counter == 5) {
      texto = 'DERROTA';
    } else {
      texto = 'Has apretado el botón esta cantidad de veces:';
    }

    return texto;
  }

  @override
  Widget build(BuildContext context) {
    print('home build method');

    final Widget svg = _icono();

    var scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú Principal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Detalles'),
              onTap: () {
                  auditor.Auditoria.add( 'detalles \n');
              Navigator.push(
              context,
              MaterialPageRoute(
              
                builder: (context) => const Detalle(),
                    ),
              );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              
              onTap: () {
                  auditor.Auditoria.add( 'sobre \n');
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Sobre(),
                    ),
              );
        
               
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Auditoria'),
              onTap: () {
                 auditor.Auditoria.add( 'auditoria \n');
                  Navigator.push(
              context,
              MaterialPageRoute(
                    builder: (context) => const auditoria(),
                    ),
              );
        
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      svg,
                      const SizedBox(height: 20),
                      Text(
                        _text(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('-1'),
                            onPressed: _decrementCounter,
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('+1'),
                            onPressed: _incrementCounter,
                          ),
                          const SizedBox(width: 8),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
     

    );
    return scaffold;
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget, mounted: $mounted');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate, mounted: $mounted');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose, mounted: $mounted');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble, mounted: $mounted');
  }
}













////////////////////////////////////////////////////////Detalle////////////////////////////////////////////////////////////////

class Detalle extends StatelessWidget {
  const Detalle({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffold6 = Scaffold(
      appBar: AppBar(
        title: const Text('Detalle'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'informacion sobre detalles',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            
          ],
          
        ),
      ),
      
      persistentFooterButtons: <Widget>[
        TextButton(
            onPressed:(){
               
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Sobre(),
                  ),
                );
              },
              child: const Text('Sobre'),
        ),

        TextButton(
          onPressed:(){
               
            Navigator.pop(context);
          },
        child: const Text('Volver'),)
      ]
    );

    var scaffold5 = scaffold6;
    var scaffold4 = scaffold5;
    var scaffold3 = scaffold4;
    var scaffold2 = scaffold3;
    var scaffold = scaffold2;
    return scaffold;

  }
}






////////////////////////////////////////////////////////Sobre////////////////////////////////////////////////////////////////

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffold6 = Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Software programado Por Sergio Poblete',
              style: TextStyle(fontSize: 24),
            ),
             SizedBox(height: 20),
          
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
      
        TextButton(
          onPressed:(){
               
            Navigator.pop(context);
          },
        child: const Text('Volver'),)
      ]
      
    );
    
    var scaffold5 = scaffold6;
    var scaffold4 = scaffold5;
    var scaffold3 = scaffold4;
    var scaffold2 = scaffold3;
    var scaffold = scaffold2;
    return scaffold;
    
  }
}





////////////////////////////////////////////////////////auditoria//////////////////////////////////////////
///
class auditoria extends StatelessWidget {
  const auditoria({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffold6 = Scaffold(
      appBar: AppBar(
        title: const Text('auditoria'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
        auditor.imprimir(),
              style: const TextStyle(fontSize: 24),
            ),
             const SizedBox(height: 20),
          
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
      
        TextButton(
          onPressed:(){
               
            Navigator.pop(context);
          },
        child: const Text('Volver'),)
      ]
      
    );
    
    var scaffold5 = scaffold6;
    var scaffold4 = scaffold5;
    var scaffold3 = scaffold4;
    var scaffold2 = scaffold3;
    var scaffold = scaffold2;
    return scaffold;
    
  }
}


















