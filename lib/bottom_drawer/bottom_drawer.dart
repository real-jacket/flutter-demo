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

  // void _show() {
  //   print("show");
  //   if (_controller.value < _controller.halfBound) {
  //     _controller.launchTo(_controller.value, _controller.halfBound);
  //   }
  // }

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
    // print("viePadding" + MediaQuery.of(context).viewPadding.toString());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.white, // status bar color
    ));
    _controller.upperBoundValue = AnimationControllerValue(
        pixel: MediaQuery.of(context).size.height.toDouble() - 32.4);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32.4),
        child: Container(
          child: RubberBottomSheet(
            scrollController: _scrollController,
            lowerLayer: LowerLayer(),
            upperLayer: UpperLayer(controller: _controller,scrollController: _scrollController,),
            animationController: _controller,
          ),
        ),
      ),
    );
  }

  // Widget _getLowerLayer() {
  //   return Container(
  //     decoration: BoxDecoration(color: Colors.white30),
  //   );
  // }

  // Widget _getUpperLayer() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: <Widget>[
  //       Container(
  //         decoration: BoxDecoration(
  //             border: Border(
  //           top: BorderSide(
  //               width: 1, color: Colors.grey, style: BorderStyle.solid),
  //           bottom: BorderSide(
  //               width: 1, color: Colors.grey, style: BorderStyle.solid),
  //         )),
  //         height: 50,
  //         child: Row(
  //           children: <Widget>[
  //             IconButton(
  //               highlightColor: Colors.blue,
  //               iconSize: 30,
  //               padding: EdgeInsets.all(10),
  //               icon: Icon(Icons.photo_size_select_actual),
  //               onPressed: () {
  //                 _show();
  //               },
  //             ),
  //             IconButton(
  //               iconSize: 30,
  //               padding: EdgeInsets.all(10),
  //               icon: Icon(Icons.tag_faces),
  //               onPressed: () {},
  //             ),
  //             IconButton(
  //               iconSize: 30,
  //               padding: EdgeInsets.all(10),
  //               icon: Icon(Icons.alternate_email),
  //               onPressed: () {},
  //             ),
  //             IconButton(
  //               iconSize: 30,
  //               padding: EdgeInsets.all(10),
  //               icon: Icon(Icons.link),
  //               onPressed: () {},
  //             ),
  //           ],
  //         ),
  //       ),
  //       Expanded(
  //         flex: 1,
  //         child: Container(
  //           decoration: BoxDecoration(color: Colors.cyan),
  //           child: ListView.builder(
  //               physics: NeverScrollableScrollPhysics(),
  //               controller: _scrollController,
  //               itemBuilder: (BuildContext context, int index) {
  //                 return ListTile(title: Text("Item $index"));
  //               },
  //               itemCount: 100),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
