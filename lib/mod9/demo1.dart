import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

import 'Joke.dart';

void main() {
  runApp(DemoAPI());
}

class DemoAPI extends StatefulWidget {
  @override
  State<DemoAPI> createState() => _DemoAPIState();
}

class _DemoAPIState extends State<DemoAPI> {
  Joke? myJoke;
  List<Joke> jokes = [];

  void callForASingleJoke() async {
    //prépartion de l'url
    var url = Uri.parse("https://api.chucknorris.io/jokes/random");
    //récupérer la réponse
    var response = await get(url);
    if (response.statusCode == 200) {
      //convertir le response en json
      var json = convert.jsonDecode(response.body);
      setState(() {
        //mettre à jour la vue en mettant à jour l'objet
        myJoke = Joke.fromJson(json);
      });
    }
  }

  void callForAJokeList() async {
    //prépartion de l'url
    var url = Uri.parse("https://api.chucknorris.io/jokes/search?query=Robin");

    //récupérer la réponse
    var response = await get(url);

    if (response.statusCode == 200) {
      //convertir le response en json
      var json = convert.jsonDecode(response.body)['result'];
      if (json is List) {
        setState(() {
          jokes =
              List<Joke>.from(json.map((jsonJoke) => Joke.fromJson(jsonJoke)));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            FilledButton(
                onPressed: callForASingleJoke, child: Text("Get a Joke !")),
            Text(myJoke != null ? "${myJoke!.content}" : "Pas de joke"),
            FilledButton(
                onPressed: callForAJokeList, child: Text("Get jokes !")),
            Expanded(
              child: ListView.builder(
                  itemCount: jokes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(jokes[index].content!);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
