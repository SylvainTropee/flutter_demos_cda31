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
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callForAJokeList();
  }

  void callForASingleJoke() async {
    //prépartion de l'url
    var url =
        Uri.parse("https://api.chucknorris.io/jokes/search?query=${searchController.text}");
    print(url);
    //récupérer la réponse
    var response = await get(url);
    if (response.statusCode == 200) {
      //convertir le response en json
      var json = convert.jsonDecode(response.body);
      print(json);
      setState(() {
        //mettre à jour la vue en mettant à jour l'objet
        myJoke = Joke.fromJson(json['result'][0]);
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
            TextField(
                controller: searchController,
                decoration: InputDecoration(
                    labelText: "Rechercher", icon: Icon(Icons.search))),
            FilledButton(
                onPressed: callForASingleJoke, child: Text("Get a Joke !")),
            Text(myJoke != null ? "${myJoke!.content}" : "Pas de joke"),
            FilledButton(
                onPressed: callForAJokeList, child: Text("Get jokes !")),
            Expanded(
              child: FutureBuilder<Response>(
                  future: get(Uri.parse(
                      "https://api.chucknorris.io/jokes/search?query=Robin")),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data?.body != null) {
                      var body = snapshot.data?.body;

                      var json = convert.jsonDecode(body!);
                      json = json['result'];

                      jokes = List<Joke>.from(
                          json.map((jsonJoke) => Joke.fromJson(jsonJoke)));
                      return Expanded(
                        child: ListView.builder(
                            itemCount: jokes.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(jokes[index].content!);
                            }),
                      );
                    }

                    return CircularProgressIndicator();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
