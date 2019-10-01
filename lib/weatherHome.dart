import 'package:flutter/material.dart';
import './appBar.dart';
import './utils.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:convert';

class weatherHome extends StatefulWidget {
  @override
  _weatherHomeState createState() => _weatherHomeState();
}

class _weatherHomeState extends State<weatherHome> {

  void showStuff() async{
    Map data= await geteather(util.appId, util.defaultCity);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:new Text('weather'),
        backgroundColor: Colors.deepPurpleAccent,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: showStuff,
          )
        ],
      ),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(
            'images/background.jpg',
            fit: BoxFit.cover,
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 100.0, 30.0, 0.0),
            child: new Text(
              'khulna',
              style: cityStyle(),
            ),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(40.0, 350.0, 0.0, 0.0),
            child: updateTempWidget("khulna"),
          ),
        ],
      ),
    );
  }

  Future<Map> geteather(String appId,String city) async {
    String apiUrl='https://samples.openweathermap.org/data/2.5/weather?q=$city&appid=$appId';
    http.Response response =await http.get(apiUrl);
    return jsonDecode(response.body);
  }

  Widget updateTempWidget(String city) {
    return new FutureBuilder(
      future: geteather(util.appId, city),
        builder:(BuildContext context,AsyncSnapshot<Map> snapshot) {
        if(snapshot.hasData) {
            Map content=snapshot.data;
            return new Container(
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    title: new Text(content['main']['temp'].toString(),
                      style: tempStyle(),
                    ),
                  )
                ],
              ),
            );
          }
        else{
          return new Container();
        }
        });
  }
}

TextStyle cityStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 23.0,
    fontStyle: FontStyle.italic,
  );
}

TextStyle tempStyle() {
  return new TextStyle(
    color: Colors.red,
    fontSize: 50.0,
    fontStyle: FontStyle.normal,
  );
}
