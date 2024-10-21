import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppData.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
String icon_1 = 'assets/icons/8665113_chess_icon.svg';
const font_1 = 'miFuente';

//var logger = Logger( printer: PrettyPrinter());








////////////////////////////////////////////////////////Home////////////////////////////////////////////////////////////////





class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _userName = '';  // Nombre de usuario desde preferencias
  int _counter = 0;        // Contador desde preferencias

  @override
  void initState() {
    super.initState();
    _loadPreferences();  // Cargar las preferencias al iniciar
  }

  // Método para cargar las preferencias desde SharedPreferences
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? 'Invitado';
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  // Método para guardar las preferencias en SharedPreferences
  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _userName);
    await prefs.setInt('counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menú Principal',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Detalles'),
              onTap: () {
                context.read<AppData>().actions.add('Usuario fue a detalles\n');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Detalle()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () {
                context.read<AppData>().actions.add('Usuario fue a sobre\n');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Sobre()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Auditoría'),
              onTap: () {
                context.read<AppData>().actions.add('Usuario fue a auditoría\n');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const auditoria()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Preferencias'),
              onTap: () {
                context.read<AppData>().actions.add('Usuario fue a preferencias\n');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Preferencias()),
                ).then((_) {
                  _loadPreferences();  // Recargar preferencias al volver
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _userName.isNotEmpty ? 'Hola, $_userName!' : 'Bienvenido!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Has apretado el botón esta cantidad de veces:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: const Text('-1'),
                  onPressed: () {
                    setState(() {
                      if(_counter > 0){
                          _counter--;
                      }
                     
                    });
                    _savePreferences();  // Guardar cambios
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('+1'),
                  onPressed: () {
                    setState(() {
                     if(_counter < 100){
                          _counter++;
                      }
                    });
                    _savePreferences();  // Guardar cambios
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('reset'),
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                    _savePreferences();  // Guardar cambios
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
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




////////////////////////////////////////////////////////Preferencias////////////////////////////////////////////////////////////////



class Preferencias extends StatefulWidget {
  const Preferencias({super.key});

  @override
  _PreferenciasState createState() => _PreferenciasState();
}

class _PreferenciasState extends State<Preferencias> {
  String _userName = '';
  int _counter = 0;
  final TextEditingController _userNameController = TextEditingController();

  // Método para cargar las preferencias
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '';
      _counter = prefs.getInt('counter') ?? 0;
      _userNameController.text = _userName; 
    });
  }

  // Método para guardar las preferencias
  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _userName);
    await prefs.setInt('counter', _counter);
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  @override
  void dispose() {
    _userNameController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencias'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre de usuario',
                ),
                onChanged: (value) {
                  setState(() {
                    _userName = value; 
                  });
                  _savePreferences(); 
                },
              ),
            ),
            const SizedBox(height: 20),
       
            Slider(
              value: _counter.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              label: _counter.toString(),
              onChanged: (double value) {
                setState(() {
                  _counter = value.toInt(); 
                });
                _savePreferences(); 
              },
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Volver'),
        ),
      ],
    );
  }
}