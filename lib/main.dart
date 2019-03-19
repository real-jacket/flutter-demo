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
      home: Drag(),
    );
  }
}

class Drag extends StatefulWidget {
  @override
  _DragState createState() =>
      _DragState();
}

class _DragState extends State<Drag> {

  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势检测'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child:CircleAvatar(child: Text('A'),),
              onPanDown: (DragDownDetails e){
                print("用户手指按下：${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e){
                setState(() {
                  setState(() {
                   _left +=e.delta.dx;
                   _top +=e.delta.dy; 
                  });
                });
              },
              onPanEnd: (DragEndDetails e){
                print(e.velocity);
              },
            ),
          )
        ],
      ),
    );
  }


}
