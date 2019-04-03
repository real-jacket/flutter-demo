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
      body: Center(child: InheritedWidgetTestRoute()),
    );
  }
}

class ShareDateWidget extends InheritedWidget {
  ShareDateWidget({@required this.data, Widget child}) : super(child: child);

  final int data; // 需要在子树中共享的数据，保存点击次数

  // 定义一个便笺方法，方便子树中的widget获取共享数据
  static ShareDateWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDateWidget);
  }

  // 该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDateWidget old) {
    // 如果返回true，则子树中依赖（build函数中有调用）本Widget
    // 的子 widget 的state.didChangeDependencies会被调用
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => new __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // 使用InheritedWidget中共享数据
    return Text(ShareDateWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 父或祖先widget中的InheritedWidget 改变（updateShouldNotify返回true）时会被调用
    // 如果build中没有依赖InheritedWidget,则此回调不会被调用。
    print("Dependencies change");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() =>
      _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDateWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(), // 子widget中依赖ShareDataWidget
            ),
            RaisedButton(
              child: Text('Increment'),
              // 每点击一次，将count自增，然后重新build，ShareDataWidget的data将被更新
              onPressed: () => setState(() => ++count),
            )
          ],
        ),
      ),
    );
  }
}
