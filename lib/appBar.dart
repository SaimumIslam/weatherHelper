import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      //elevation: 0.0,
      title: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            'Friday, August 29',
            style: new TextStyle(
              color: Colors.red,
              fontSize: 16.0,
            ),
          ),
          new Text(
            'Khulna',
            style: new TextStyle(
              color: Colors.red,
              fontSize: 30.0,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(
            Icons.menu,
            color:Colors.red ,
            size: 35.0,
          ),
          onPressed: (){
            debugPrint('hey');
          },
        ),
      ],
    );
  }
}
