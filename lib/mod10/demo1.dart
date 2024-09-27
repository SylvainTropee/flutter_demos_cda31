import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }
}

class DemoProvider extends StatefulWidget {
  @override
  State<DemoProvider> createState() => _DemoProviderState();
}

class _DemoProviderState extends State<DemoProvider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Provider.of<CounterProvider>(context, listen: false).increment();
            },
            icon: Icon(Icons.add)),
        Consumer<CounterProvider>(builder: (context, value, child) {
          return Text("${value.counter}");
        }),
        IconButton(
            onPressed: () {
              Provider.of<CounterProvider>(context,listen: false).decrement();
            },
            icon: Icon(Icons.remove))
      ],
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            DemoProvider(),
            Consumer<CounterProvider>(builder: (context, value, child){
              return Text("${value.counter}");
            })
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CounterProvider())
  ], child: Home()));
}
