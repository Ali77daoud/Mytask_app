import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  String title;
  Color titlecolor;
  double titlesize;
  Color firstcolor;
  Color secondcolor;
  GradientAppBar({
    required this.title,
    required this.titlecolor,
    required this.titlesize,
    required this.firstcolor,
    required this.secondcolor,
    });
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.only(
          top: MediaQuery.of(context).padding.top
        ),
        child: new Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            top: 20.0,
            bottom: 20.0
          ),
          child: new Text(
            title,
            style: new TextStyle(
              fontSize: titlesize,
              fontWeight: FontWeight.w500,
              color: titlecolor,
            ),
          ),
        ),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              firstcolor,
              secondcolor,
            ]
          ),
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0,
              spreadRadius: 1.0,
            )
          ]
        ),
      );
  }
}