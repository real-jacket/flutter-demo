import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: ScaleImg(),
    );
  }
}

class ScaleImg extends StatefulWidget {
  @override
  _ScaleImgState createState() => _ScaleImgState();
}

class _ScaleImgState extends State<ScaleImg> {
  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势检测'),
      ),
      body: Center(
        child: GestureDetector(
          child: Image.network(
              'http://easyread.ph.126.net/pg-5nIfYApOfzPab3hWobA==/7806611722048198046.jpg',
              width: _width),
          onScaleUpdate: ((ScaleUpdateDetails details) {
            setState(() {
              _width = 200 * details.scale.clamp(.8, 10.0);
            });
          }),
        ),
      ),
    );
  }
}
