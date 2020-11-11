library my_prj.globals;

import 'package:flutter/material.dart';

Widget pageBody(List<Widget> pageXWidget, BuildContext context) {
  return SafeArea(
    child: Stack(
      children: [
        new Stack(
          children: [
            new ClipRect(
              child: Container(
                child: Align(
                  heightFactor: 0.45,
                  child: Image(
                    image: AssetImage("assets/images/orange_yellow_bg.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: new Text(
                  "co-bee",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        new Container(
          height: MediaQuery.of(context).size.height * 0.8,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          padding: EdgeInsets.fromLTRB(25, 40, 25, 40),
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: pageXWidget,
            ),
          ),
        ),
      ],
    ),
  );
}
