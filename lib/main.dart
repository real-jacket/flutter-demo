import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Gestrue(),
    );
  }
}

class Gestrue extends StatefulWidget {
  @override
  _GestrueState createState() => _GestrueState();
}

class _GestrueState extends State<Gestrue> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势检测'),
      ),
      body: Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: '你好世界'),
          TextSpan(
              text: '点我变色',
              style: TextStyle(
                  fontSize: 30.0, color: _toggle ? Colors.blue : Colors.red),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                }),
          TextSpan(text: '你好世界')
        ])),
      ),
    );
  }
}
