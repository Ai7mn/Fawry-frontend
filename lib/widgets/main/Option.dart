import 'package:flutter/material.dart';

class Option extends StatelessWidget {

  Option(this.icon , this.text );
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white70 ,
      child: Container(
        height: 90,
        width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                child: IconTheme(
                  data: IconThemeData(
                      color:Colors.white),
                  child: Icon(icon , size: 55 , ),
                ),
                padding: EdgeInsets.all(0),
              ),
              Text(text , style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
    );
  }
}
