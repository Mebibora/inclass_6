import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget that will be started on the application startup
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  //set counter value
  int _counter = 0;

  void _abort() {
    setState(() {
      if (_counter == 0){
        _counter = 0;
      } else{
        _counter -= 1;
      }
      
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  void _ignite() {
    setState(() {
      if (_counter == 100){
        _counter = 100;
      } else{
        _counter += 1;
      }
    });
  }

  Color _displayColor(int counter) {
    
      if(counter == 0){
        return Colors.red;
      } else if(counter <= 50){
        return Colors.yellow;
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
//set up the widget alignement
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: _displayColor(_counter),
              child: Text(
                //to displays current number
                '$_counter',
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
          Center(
            
            child: Row(
            
              children: [
                ElevatedButton(
                  
                  onPressed: () {
                    _abort();
                  },
                  child: Text('Abort'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _reset();
                  },
                  child: Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _ignite();
                  },
                  child: Text('Ignite'),
                ),
              ]
            )
          )
        ],
      ),
    );
  }
}
