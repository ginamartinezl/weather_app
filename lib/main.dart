import 'package:clima/widgets/controller.dart';
import 'package:flutter/material.dart';
import './widgets/search.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("Fav");
  controllerFav Control = controllerFav();
  Control.leerFavoritos();
  Get.put(Control);
  runApp(
  MaterialApp(
    title: "Weather App",
    home: Obx(()=>search(recentcities: Control.Favs)),
  )
  );
  
}