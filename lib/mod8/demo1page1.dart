import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 1")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("PAGE 1 !", style: TextStyle(fontSize: 18)),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/page-two", arguments: 456);
                //permet de supprimer la flèche retour en remplaçant la page de base
                // Navigator.pushReplacementNamed(context, "/page-two", arguments: 456);
              },
              child: Text("GO TO PAGE 2 !"))
        ],
      ),
    );
  }
}
