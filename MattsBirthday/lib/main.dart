import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page Wow'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isItMattsBirthday;
  String _secondsRemaining;
  Timer _secondTimer;

  void _checkForMattsBirthday() {
    setState(() {
      final _now = DateTime.now();
      final _birthday = DateTime(_now.year + 1, 5, 3);
      _secondsRemaining = _birthday.difference(_now).inSeconds.toString();
      if(_now.month == 5 && _now.day == 3) {
        _isItMattsBirthday = true;
      } else {
        _isItMattsBirthday = false;
      }
    });
  }

  void initState() {
    super.initState();
    _checkForMattsBirthday();

    _secondTimer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _checkForMattsBirthday();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _secondsRemaining,
            ),
            Text(
              _isItMattsBirthday.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
