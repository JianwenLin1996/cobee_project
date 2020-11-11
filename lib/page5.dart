import 'package:flutter/services.dart';

import 'globals.dart' as globals;

import 'package:flutter/material.dart';

class PageFive extends StatefulWidget {
  @override
  _PageFiveState createState() => _PageFiveState();
}

class _PageFiveState extends State<PageFive> {
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
            inputField('Mobile Number', 'MN'),
            inputField('Postal Code', 'PC'),
            Padding(padding: EdgeInsets.all(40))
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
              _formKey.currentState.validate();
            },
            child: new Text(
              "Connect Now",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      )
    ];
  }
  //FilteringTextInputFormatter.allow(RegExp(r"^(\d{1,3}[- ]?)?\d{7}$"))

  Widget inputField(String hint, String code) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
        validator: (value) {
          if (value.isEmpty) {
            return "This field is required.";
          } else if (code == 'MN') {
            RegExp regExp = new RegExp(r"^(\d{2,3})?\d{7}$");
            if (!regExp.hasMatch(value)) {
              return "Please fill in correct mobile number";
            }
          } else if (code == 'PC') {
            RegExp regExp = new RegExp(r"^\d{5}$");
            if (!regExp.hasMatch(value)) {
              return "Please fill in correct postal code";
            }
          }
        },
      ),
    );
  }
}
