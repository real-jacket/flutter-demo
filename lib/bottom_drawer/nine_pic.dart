import 'package:flutter/material.dart';
import 'dart:ui';

class NinePic extends StatefulWidget {
  @override
  _NinePicState createState() => _NinePicState();
}

class _NinePicState extends State<NinePic> {
  List<Widget> list;

  @override
  void initState() {
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    return Container(
        width: width,
        // height: height / 2,
        child: Wrap(
          children: list,
          spacing: 12.0,
          crossAxisAlignment: WrapCrossAlignment.center,
        ));
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (list.length < 10) {
          setState(() {
            list.insert(list.length - 1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              border: Border.all(
                color: Colors.black,
              )),
          width: 100.0,
          height: 100.0,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }
}
