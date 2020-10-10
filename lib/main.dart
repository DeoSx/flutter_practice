import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: Text('infinite list items')),
            body: Center(
              child: MyBody(),
            )));
  }
}

class MyBody extends StatefulWidget {
  @override
  createState() => MyBodyState();
}

class MyBodyState extends State<MyBody> {
  List<String> _array = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, i) {
      final int num = 2;
      final int index = i + 1;

      if (index >= _array.length) _array.addAll([pow(num, index).toString()]);
      print(_array);

      return ListTile(
        title: Text('$num ^ $index = ${_array[i]}'),
      );
    });
  }
}
