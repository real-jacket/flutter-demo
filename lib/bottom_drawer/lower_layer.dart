import 'package:flutter/material.dart';
import './nine_pic.dart';

class LowerLayer extends StatelessWidget {
  // final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.grey),
          height: 100,
          // child: TextField(),
        ),
        Expanded(
          child: NinePic(),
        )
      ],
    );
  }
}
