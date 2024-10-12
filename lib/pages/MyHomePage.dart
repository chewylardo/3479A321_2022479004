import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppData.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

String icon_1 = 'assets/icons/8665113_chess_icon.svg';
const font_1 = 'miFuente';
//var logger = Logger( printer: PrettyPrinter());








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

 



  late String icon_1;

  Widget _icono() {
    if (context.watch<AppData>().counter == 10) {
      icon_1 = 'assets/icons/8665991_trophy_icon.svg';
    } else if (context.watch<AppData>().counter == 5) {
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
    if (context.watch<AppData>().counter == 10) {
      texto = 'VICTORIA';
    } else if (context.watch<AppData>().counter== 5) {
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
                  context.read<AppData>().auditor.add( 'usuario fue a detalles \n');
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
                  context.read<AppData>().auditor.add( 'usuario fue a sobre \n');
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
                  context.read<AppData>().auditor.add('usuario fue a auditoria \n');
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
                        context.watch<AppData>().counter.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('-1'),
                            onPressed: context.read<AppData>().decrementCounter,
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('+1'),
                            onPressed: context.read<AppData>().incrementCounter,
                          ),
                          TextButton(
                            child: const Text('reset'),
                            onPressed: context.read<AppData>().resetCounter,
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
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              
              'informacion sobre detalles\n el contador es de: ${context.watch<AppData>().cont()}',
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
       context.read<AppData>().toStringAud() ,
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


















