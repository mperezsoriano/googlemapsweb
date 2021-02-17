import 'package:flutter/material.dart';
import 'dart:html';
import "package:google_maps/google_maps.dart" hide Icon;
import 'package:universal_ui/universal_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: getMap(),
    );
  }
}

Widget getMap() {
  String htmlId = "7";
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final myLatLng = LatLng(40.36, 1.0);
    final mapOptions = MapOptions()
      ..zoom = 8
      ..center = LatLng(40.36, 1.0);
    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    final map = GMap(elem, mapOptions);

    Marker(MarkerOptions()
      ..position = myLatLng
      ..map = map
      ..title = 'Mapa');
    return elem;
  });
  return HtmlElementView(
    viewType: htmlId,
  );
}
