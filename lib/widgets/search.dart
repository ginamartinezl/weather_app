import 'dart:isolate';
import 'package:clima/widgets/display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'controller.dart';

class search extends StatelessWidget {
  var assetsImage = new AssetImage('assets/logo.png');

  search({required this.recentcities});
  final recentcities;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Clima"),
        backgroundColor: Colors.amber[600],
        actions: <Widget>[
          IconButton(
              icon: FaIcon(FontAwesomeIcons.searchLocation),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: SearchCountry(recentCities: recentcities));
              }),
        ],
      ),
      body: Container(
          child: Image.network(
              'https://image.freepik.com/vector-gratis/ilustracion-otono-nina-paraguas_84081-124.jpg'),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
      drawer: Drawer(),
    ));
  }
}

class SearchCountry extends SearchDelegate<String> {
  SearchCountry({required this.recentCities});
  final controllerFav C = Get.find();
  final cities = [
    "Bogota",
    "Cali",
    "Medellin",
    "Hamilton",
    "Toronto",
    "London,uk"
        "Dubai",
    "Boston",
    "Venecia",
    "Lima",
    "Tokio",
    "Shanghai",
    "Angeles",
    "Paris",
    "Chicago",
    "Filadelfia",
    "Atlanta",
    "Viena",
    "Roma",
    "Barcelona",
    "Montreal",
    "Atenas",
    "Orlando",
    "Vancouver",
    "Amberes",
    "Lisboa",
    "Vegas",
    "Praga",
    "Sapporo",
    "Leeds",
    "Lagos",
    "Daegu",
    "Seoul",
    "Busan",
    "Niigata",
    "Niza",
    "Salvador",
    "Quebec",
    "Nantes",
    "Springfield",
    "Gwangju",
  ];

  final recentCities;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: FaIcon(FontAwesomeIcons.times),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  // @override
  // Widget buildResults(BuildContext context) {
  //   return Center(
  //     child: Container(
  //       height: 100.0,
  //       width: 100.0,
  //       child: Card(
  //         color: Colors.red,
  //         child:  Center(
  //           child: Text(query),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget buildResults(BuildContext context) {
    return WeatherApp(name: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final sugesstionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: FaIcon(FontAwesomeIcons.mapMarkedAlt),
        title: RichText(
          text: TextSpan(
              text: sugesstionList[index].substring(0, query.length),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: sugesstionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: sugesstionList.length,
    );
  }
}
