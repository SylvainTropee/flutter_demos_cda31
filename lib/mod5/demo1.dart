import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Layout'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;

  MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
          color: Colors.amber,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Colonne 1 - Ligne 1",
                          style: TextStyle(color: Colors.blue, fontSize: 24)),
                      SizedBox(height: 2000),
                      Text("Colonne 1 - Ligne 2"),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Text("Colonne 2 - Ligne 1"),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Colonne 2 - Ligne 2"),
                  ),
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      Text("Colonne 3 - Ligne 1"),
                      Text("Colonne 3 - Ligne 2"),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
