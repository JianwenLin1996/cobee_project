import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  MediaQueryData queryData;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    TextStyle style38 = new TextStyle(
      inherit: true,
      fontSize: 38.0,
    );
    TextStyle style20 = new TextStyle(
      inherit: true,
      fontSize: 20.0,
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("here"),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Text(
            'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
            style: style38,
          ),
          new Text(
            'size (pixels): w=${queryData.size.width * devicePixelRatio}, h=${queryData.size.height * devicePixelRatio}',
            style: style20,
          ),
          new Text(
            'devicePixelRatio: $devicePixelRatio',
            style: style20,
          ),
          new Text(
            'size: w=${queryData.size.width}, h=${queryData.size.height}',
            style: style20,
          ),
          new Text(
            'textScaleFactor: w=${queryData.textScaleFactor}',
            style: style20,
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
