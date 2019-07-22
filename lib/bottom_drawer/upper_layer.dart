import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';

class UpperLayer extends StatelessWidget {
  final RubberAnimationController controller;
 final ScrollController scrollController;
  UpperLayer({Key key,this.controller,this.scrollController}):super(key:key);

void _show() {
    print("show");
    if (controller.value < controller.halfBound) {
      controller.launchTo(controller.value, controller.halfBound);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(
                width: 1, color: Colors.grey, style: BorderStyle.solid),
            bottom: BorderSide(
                width: 1, color: Colors.grey, style: BorderStyle.solid),
          )),
          height: 50,
          child: Row(
            children: <Widget>[
              IconButton(
                highlightColor: Colors.blue,
                iconSize: 30,
                padding: EdgeInsets.all(10),
                icon: Icon(Icons.photo_size_select_actual),
                onPressed: () {
                  _show();
                },
              ),
              IconButton(
                iconSize: 30,
                padding: EdgeInsets.all(10),
                icon: Icon(Icons.tag_faces),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30,
                padding: EdgeInsets.all(10),
                icon: Icon(Icons.alternate_email),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30,
                padding: EdgeInsets.all(10),
                icon: Icon(Icons.link),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(color: Colors.cyan),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text("Item $index"));
                },
                itemCount: 100),
          ),
        ),
      ],
    );
  }
}