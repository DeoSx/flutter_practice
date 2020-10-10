import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('test'),
          ),
          body: NewsBox(
            'Hello Wolrd',
            'I learn flutter!',
          )),
    );
  }
}

class NewsBox extends StatelessWidget {
  final String _title;
  final String _text;
  String _imageUrl;

  NewsBox(this._title, this._text, {String imageUrl}) {
    _imageUrl = imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    if (_imageUrl != null && _imageUrl != '') {
      return Container(
        color: Colors.black12,
        height: 100.0,
        child: Row(
          children: [
            Image.network(
              _imageUrl,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(_title,
                      style: new TextStyle(fontSize: 20.0),
                      overflow: TextOverflow.ellipsis),
                  Expanded(
                      child: Text(
                    _text,
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ))
                ],
              ),
            ))
          ],
        ),
      );
    }

    return Container(
        color: Colors.black12,
        height: 100.0,
        child: Row(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(
                    _title,
                    style: TextStyle(fontSize: 20.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                  new Expanded(
                      child: new Text(
                    _text,
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ))
                ],
              ),
            ))
          ],
        ));
  }
}
