import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  // Contador y lista de acciones
  int _contador = 0;
  List<String> _actions = [];

  // Getters
  int get counter => _contador;
  List<String> get actions => _actions;


  void incrementCounter() {
    _contador++;
    _actions.add('Usuario aumento el contador a $_contador \n');
    notifyListeners(); 
  }


  void decrementCounter() {
    _contador--;
    _actions.add('Usuario redujo el contador a $_contador \n');
    notifyListeners();
  }

  void resetCounter() {
    _contador = 0;
    _actions.add(' Usuario reseteo el contador a $_contador \n');
    notifyListeners();
  }

  void paginas(String a){
    _actions.add(a);

  }






  String toStringAud(){

    String elString = '';

    
      for(int i = 0;i<actions.length;i++){

        elString = elString + actions[i];


      }

    return elString;
  }



  String cont(){

    String contar = _contador.toString();

    return contar;
  }





}