import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';
import 'package:flutter/services.dart';
import './upper_layer.dart';
import './lower_layer.dart';

class ScrollPage extends StatefulWidget {
  ScrollPage({Key key}) : super(key: key);

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage>
    with SingleTickerProviderStateMixin {
  RubberAnimationController _controller;
  bool activeKeyborad;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    activeKeyborad = false;
    _controller = RubberAnimationController(
        springDescription: SpringDescription.withDampingRatio(
          mass: 1,
          stiffness: Stiffness.HIGH,
          ratio: DampingRatio.NO_BOUNCY,
        ),
        vsync: this,
        lowerBoundValue: AnimationControllerValue(pixel: 50.0),
        halfBoundValue: AnimationControllerValue(percentage: 0.5),
        duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("viewPadding" + MediaQuery.of(context).viewPadding.toString());
    final top = MediaQuery.of(context).viewPadding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.white, // status bar color
    ));
    _controller.upperBoundValue = AnimationControllerValue(
        pixel: MediaQuery.of(context).size.height.toDouble() - top);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: top),
        child: Container(
          child: RubberBottomSheet(
            onDragEnd: () {
              print("onDragEnd");
            },
            scrollController: _scrollController,
            lowerLayer: LowerLayer(),
            upperLayer: UpperLayer(
              controller: _controller,
              scrollController: _scrollController,
            ),
            animationController: _controller,
          ),
        ),
      ),
    );
  }
}
