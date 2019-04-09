import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Cached Images';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Center(
          child: new CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl:
                'http://b-ssl.duitang.com/uploads/item/201510/01/20151001212224_SJwzm.jpeg',
          ),
        ),
      ),
    );
  }
}