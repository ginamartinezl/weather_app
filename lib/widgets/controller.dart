import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class controllerFav extends GetxController{
  final favoritos = [].obs;
  List<String> get Favs => favoritos.value.map((e) => e as String).toList(); 

  void leerFavoritos(){
    favoritos.value = Hive.box("Fav").values.toList() ;
  }
  void anadirFavoritos(ciudad){
    Hive.box("Fav").add(ciudad);
    favoritos.add(ciudad);
  } 
  void eliminarFavoritos(ciudad){
    Hive.box("Fav").delete(ciudad);
    favoritos.remove(ciudad);
  }
}