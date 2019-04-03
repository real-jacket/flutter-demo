import 'package:flutter/material.dart';
import './camera_progressbar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: FlexLayoutTestRoute(),
    );
  }
}

class FlexLayoutTestRoute extends StatelessWidget {
  FlexLayoutTestRoute({Key key, this.percent, this.controller})
      : super(key: key);

  final double percent;
  final AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Circular Percent Indicators"),
      ),
      body: Center(child: WillPopScopeTestRoute()),
    );
  }
}

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() => new WillPopScopeTestRouteState();
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('1s内连续两次返回键退出'),
      ),
    );
  }
}
