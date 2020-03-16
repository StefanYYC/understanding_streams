import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  StreamController<double> controller = StreamController<double>.broadcast();
  StreamSubscription<double> streamSubscription;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                child: Text(
                  'Subscribe'
                ),
                color: Colors.yellow,
                onPressed: () async {
                  getDelayedRandomValue().listen((value){
                    print('Random value : $value');
                  });
                },
              ),
              MaterialButton(
                child: Text('Envoyer value'),
                color: Colors.blue[200],
                onPressed: () {
                  controller.add(12);
                },
              ),
              MaterialButton(
                child: Text("Unsubscribed"),
                color: Colors.red[200],
                onPressed: (){
                  streamSubscription?.cancel();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Stream<double> getDelayedRandomValue() async* {
    var random = Random();
    while(true){
      await Future.delayed(Duration(seconds: 1));
      yield random.nextDouble();
    }
  }
}
