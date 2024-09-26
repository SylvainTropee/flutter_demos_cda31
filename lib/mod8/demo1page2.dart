import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    int? id = ModalRoute.of(context)!.settings.arguments as int?;

    return Scaffold(
      appBar: AppBar(title: Text("Page 2")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("PAGE 2 ! Param = ${id}", style: TextStyle(fontSize: 18)),
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Back"))
        ],
      ),
    );
  }
}
