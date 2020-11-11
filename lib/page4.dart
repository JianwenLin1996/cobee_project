import 'globals.dart' as globals;

import 'package:flutter/material.dart';

class PageFour extends StatefulWidget {
  @override
  _PageFourState createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom * 0.75),
              child: globals.pageBody(pageFourWidget(), context),
            )));
  }

  List<Widget> pageFourWidget() {
    return <Widget>[
      Container(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: new Text(
              "Create profile to connect \nto the community nearest to you.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400),
            ),
          )),
      Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputField('Mobile Number'),
            inputField('Password / PIN'),
            inputField('Confirm Password / PIN'),
            inputField('Postal Code'),
            Padding(padding: EdgeInsets.all(20))
          ],
        ),
      ),
      Center(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width * 0.55,
          child: new RaisedButton(
            color: Colors.deepOrange,
            elevation: 5.0,
            onPressed: () {
              print("r u ok");
            },
            child: new Text(
              "Sign up",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      )
    ];
  }

  Widget inputField(String hint) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20, 6, 0, 6),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    style: BorderStyle.solid, width: 2.0, color: Colors.red)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    style: BorderStyle.solid, width: 1.0, color: Colors.red)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    style: BorderStyle.solid,
                    width: 2.0,
                    color: Colors.deepOrange)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    style: BorderStyle.solid,
                    width: 1.0,
                    color: Colors.deepOrange)),
            hintText: hint),
      ),
    );
  }
}
