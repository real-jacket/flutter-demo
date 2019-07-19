import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CameraBar extends StatefulWidget {
  CameraBar(
      {Key key,
      this.height = 100,
      this.width = 100,
      this.linewidth = 5,
      this.duration = 2,
      this.animationend,
      this.progressColor = Colors.blue,
      this.backgroundColor = const Color(0xFFB8C7CB)})
      : super(key: key);

  final double height;
  final double width;
  final double linewidth;
  final duration;
  final animationend;
  final Color progressColor;
  final Color backgroundColor;

  @override
  _CameraBarState createState() => new _CameraBarState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _CameraBarState extends State<CameraBar>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: Duration(seconds: widget.duration), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    animation = new Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() => {});
      });
  }

  bool active = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPressStart: (e) {
          if (active) {
            controller.forward();
          } else {
            controller.reset();
            controller.forward();
          }
        },
        // onLongPressUp: () {
        //   controller.stop();
        //   active = false;
        //   widget.animationend();
        // },
        onLongPressUp: (){
          controller.stop();
          active = false;
          widget.animationend();
        },
        child: ClipOval(
          clipBehavior: Clip.hardEdge,
          child: Container(
              height: widget.width + widget.linewidth,
              width: widget.height + widget.linewidth,
              decoration: new BoxDecoration(
                // color: Colors.purple,
                shape: BoxShape.circle,
              ),
              child: CircularPercentIndicator(
                // fillColor: Colors.red,
                backgroundColor: widget.backgroundColor,
                progressColor: widget.progressColor,
                lineWidth: widget.linewidth,
                percent: controller.value,
                radius: widget.width,
              )),
        ));
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
