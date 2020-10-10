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
          body: NewsBox('Hello Wolrd', 'I learn flutter!',
              imageUrl: 'https://flutter.su/favicon.png', num: 0, like: false)),
    );
  }
}

// ignore: must_be_immutable

class NewsBox extends StatelessWidget {
  final String _title;
  final String _text;
  String _imageUrl;
  int _num;
  bool _like;

  NewsBox(this._title, this._text,
      {String imageUrl, int num = 0, bool like = false}) {
    _imageUrl = imageUrl;
    _num = num;
    _like = like;
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
            )),
            NewsBoxFavorite(_num, _like)
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
            )),
            NewsBoxFavorite(_num, _like)
          ],
        ));
  }
}

class NewsBoxFavorite extends StatefulWidget {
  final int _num;
  final bool _like;

  NewsBoxFavorite(this._num, this._like);

  @override
  createState() => NewsBoxFavoriteState(_num, _like);
}

class NewsBoxFavoriteState extends State<NewsBoxFavorite> {
  int num;
  bool like;

  NewsBoxFavoriteState(this.num, this.like);

  void pressButton() {
    setState(() {
      like = !like;

      if (like)
        num++;
      else
        num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'In favorite $num',
          textAlign: TextAlign.center,
        ),
        IconButton(
            icon: Icon(like ? Icons.star : Icons.star_border,
                size: 30.0, color: Colors.blue[500]),
            onPressed: pressButton)
      ],
    );
  }
}
