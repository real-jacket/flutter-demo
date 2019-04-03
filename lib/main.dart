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
      home: ThemeTestRoute(),
    );
  }
}

// class FlexLayoutTestRoute extends StatelessWidget {
//   FlexLayoutTestRoute({Key key, this.percent, this.controller})
//       : super(key: key);

//   final double percent;
//   final AnimationController controller;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text("Circular Percent Indicators"),
//       ),
//       body: Center(child: InheritedWidgetTestRoute()),
//     );
//   }
// }

class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => new _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  Color _themeColor = Colors.teal; // 当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor, //用于导航栏、FloatingAction的背景色等
          iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
          ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('主题测试'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text('颜色跟随主题')
              ],
            ),
            Theme(
              data: themeData.copyWith(
                  iconTheme: themeData.iconTheme.copyWith(color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text('颜色固定黑色')
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
                setState(() => {
                      _themeColor =
                          _themeColor == Colors.teal ? Colors.blue : Colors.teal
                    })
              },
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}
