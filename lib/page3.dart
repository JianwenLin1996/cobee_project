import 'globals.dart' as globals;

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
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom * 0.75),
            child: globals.pageBody(pageThreeWidget(), context),
          ),
        ));
  }

  List<Widget> pageThreeWidget() {
    return <Widget>[
      new Text(
        "Sign me up on the community",
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.deepOrange),
      ),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              overflow: TextOverflow.clip,
              softWrap: true,
            ),
          ),
        ],
      )
    ];
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
            width: MediaQuery.of(context).size.width * 0.55,
            height: MediaQuery.of(context).size.width * 0.11,
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
                  new Padding(padding: EdgeInsets.only(left: 10)),
                  new Flexible(child: new Text(signUpDesc)),
                ],
              ),
            ),
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 10),
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
