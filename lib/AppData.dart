import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  // Contador y lista de acciones
  int _contador = 0;
  List<String> _auditor = [];

  // Getters
  int get counter => _contador;
  List<String> get auditor => _auditor;


  void incrementCounter() {
    _contador++;
    _auditor.add('Usuario aumento el contador a $_contador \n');
    notifyListeners(); 
  }


  void decrementCounter() {
    _contador--;
    _auditor.add('Usuario redujo el contador a $_contador \n');
    notifyListeners();
  }

  void resetCounter() {
    _contador = 0;
    _auditor.add(' Usuario reseteo el contador a $_contador \n');
    notifyListeners();
  }

  void paginas(String a){
    _auditor.add(a);

  }






  String toStringAud(){

    String elString = '';

    
      for(int i = 0;i<auditor.length;i++){

        elString = elString + auditor[i];


      }

    return elString;
  }



  String cont(){

    String contar = _contador.toString();

    return contar;
  }





}