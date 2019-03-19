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
      home: DragVertical(),
    );
  }
}

class DragVertical extends StatefulWidget {
  @override
  _DragVerticalState createState() =>
      _DragVerticalState();
}

class _DragVerticalState extends State<DragVertical> {

  double _top = 0.0;

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
            child: GestureDetector(
              child:CircleAvatar(child: Text('A'),),
              onPanDown: (DragDownDetails e){
                print("用户手指按下：${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e){
                setState(() {
                  setState(() {
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
