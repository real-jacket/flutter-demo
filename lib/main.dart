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
      home: ScrollNotificationTestRoute(),
    );
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() =>
      _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pointer 事件处理'),
      ),
      body: Listener(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 300,
          height: 150,
          child: Text(
            _event?.toString() ?? '',
            style: TextStyle(color: Colors.white),
          ),
        ),
        onPointerDown: (PointerDownEvent event) =>
            setState(() => _event = event),
        onPointerMove: (PointerMoveEvent event) =>
            setState(() => _event = event),
        onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
      ),
    );
  }
}
