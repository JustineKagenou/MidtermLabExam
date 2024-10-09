import 'package:flutter/material.dart';


class Counter extends StatelessWidget { // Ito po yung pag na convert na sa StatelessWidget
  final int counter; // Counter value
  final VoidCallback onIncrement; // Callback function para sa increment

  // Constructor para sa Counter class
  const Counter({
    super.key,
    required this.counter,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    // Layout ng Counter widget
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Align sa gitna
      children: <Widget>[
        ElevatedButton(
          onPressed: onIncrement, //Dito po yung pag clinick mag cocount
          child: const Text('Increment'), 
        ),
        const SizedBox(width: 16), 
        Text(
          'Count: $counter', // I-display ang current counter value
          style: const TextStyle(
            fontSize: 30, // Font size ng counter text
            color: Colors.white, // Kulay ng counter text
          ),
        ),
      ],
    );
  }
}

// CounterApp class sa StatefulWidget
class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

// State class para sa CounterApp
class _CounterAppState extends State<CounterApp> {
  int _counter = 0; // State variable para sa counter

  // Function para i-increment ang counter value
  void _incrementCounter() {
    setState(() {
      _counter++; // Increment the counter value
    });
  }

  @override
  Widget build(BuildContext context) {
    // Layout ng buong app
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Application'), // Nag add din po ako ng heading
        backgroundColor: Colors.blue[400], // Kulay ng background ng AppBar
      ),
      backgroundColor: Colors.blue[800], // Kulay ng background ng buong app
      body: Center(
        child: Counter(
          counter: _counter, // I-pass ang current counter value sa Counter widget
          onIncrement: _incrementCounter, // I-pass ang increment function sa Counter widget
        ),
      ),
    );
  }
}

// Main function
void main() {
  runApp(
    const MaterialApp(
      home: CounterApp(), // Setting CounterApp 
    ),
  );
}
