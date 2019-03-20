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
      body: Center(
          child: CameraBar(animationend: (){
            print('动画结束');
          },)),
    );
  }
}

