import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PasswordVisibility("Password"));
}

class PasswordVisibility extends StatefulWidget {

  String label;

  PasswordVisibility(this.label);

  @override
  State<PasswordVisibility> createState() => _PasswordVisibilityState();
}

class _PasswordVisibilityState extends State<PasswordVisibility> {
  bool _isVisible = false;

  void changeVisibility(bool value){
    setState(() {
      _isVisible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo Etat !",
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                obscureText: !_isVisible,
                decoration: InputDecoration(labelText: widget.label),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_isVisible ? Icons.lock_open : Icons.lock, size: 32),
                    Switch(value: _isVisible, onChanged: changeVisibility)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
