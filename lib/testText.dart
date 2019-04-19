import 'package:flutter/material.dart';

class TestTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("练习Text"),
      ),
      body: new Row(
        children: <Widget>[
          new Text(
            "练习flutter text ",
            style: new TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.deepPurple),
            softWrap: true,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
