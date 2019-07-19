import 'package:flutter/material.dart';
import './filter_ui.dart';
import './bottom_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'UI Chalenge',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页入口"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            child: Text("UI chanllenge"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FilterUI()));
            },
          ),
          FlatButton(
            child: Text("Bottom drawer"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScrollPage()));
            },
          ),
        ],
      ),
    );
  }
}
