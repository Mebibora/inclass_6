import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _checkLaunchAlert() {
    if (_counter == 100) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Launch Alert'),
            content: const Text('Prepare for liftoff!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // closes the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Color _getCounterColor() {
    if (_counter == 0) {
      return Colors.red;
    } else if (_counter >= 1 && _counter <= 50) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: _getCounterColor(),
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter += 1;
                });
                _checkLaunchAlert();
              },
              child: const Text('Ignite'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
              },
              child: const Text('Reset'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter -= 1;
                });
              },
              child: const Text('Abort'),
            ),
            Slider(
              min: 0,
              max: 100,
              value: _counter.toDouble(),
              onChanged: (double value) {
                setState(() {
                  _counter = value.toInt();
                });
                _checkLaunchAlert();
              },
              activeColor: Colors.blue,
              inactiveColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}