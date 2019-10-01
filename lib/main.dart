import 'package:flutter/material.dart';
import './weatherHome.dart';
//void main() => runApp(MyApp());

void main() {
  runApp(
      new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        home: new weatherHome(),
  )
  );
}
