import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  final dynamic testInput;

  const TestScreen({Key key, this.testInput}) : super(key: key);
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
