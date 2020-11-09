import 'dart:ffi';

import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  bool agreementChecked = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
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
              margin: EdgeInsets.only(top: 150),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              padding: EdgeInsets.fromLTRB(25, 40, 25, 40),
              child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Text(
                      "Sign me up on the community",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.orange),
                    ),
                    new Padding(padding: EdgeInsets.all(5)),
                    signUpOptions(),
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Checkbox(
                            checkColor: Colors.deepOrange,
                            activeColor: Colors.transparent,
                            value: agreementChecked,
                            onChanged: (bool newValue) {
                              setState(() {
                                agreementChecked = newValue;
                                print(agreementChecked);
                              });
                            }),
                        Flexible(
                          fit: FlexFit.tight,
                          child: new Text(
                            'By signing up with Co-Bee, you are agreeing the following Terms & Condition and Privacy Statement',
                            style: TextStyle(fontSize: 15),
                            overflow: TextOverflow.clip,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signUpOptions() {
    return Column(
      children: [
        loginOption('assets/images/google_logo.png', "Sign-up with Google"),
        loginOption('assets/images/facebook_logo.png', "Sign-up with Facebook"),
        loginOption(
            'assets/images/mobile_icon.png', "Sign-up with Mobile Number"),
      ],
    );
  }

  Widget loginOption(String signUpIconName, String signUpDesc) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print(signUpDesc);
          },
          child: new SizedBox(
            width: 250,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.white)),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // new Container(
                  //   child: new CircleAvatar(
                  //     backgroundColor: Colors.white,
                  //     backgroundImage: new AssetImage(signUpIconName),
                  //   ),
                  // ),
                  new Container(
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset(signUpIconName),
                  ),
                  new Padding(padding: EdgeInsets.all(5)),
                  new Text(signUpDesc),
                ],
              ),
            ),
          ),
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        )
      ],
    );
  }
}

/*

      appBar: new PreferredSize(
        preferredSize: Size.fromHeight(130.0),
        child: AppBar(
          title: new Container(
            child: new Center(
              child: new Text(
                "co-bee",
              ),
            ),
          ),
          flexibleSpace: Image(
            image: AssetImage("assets/images/orange_yellow_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
*/
