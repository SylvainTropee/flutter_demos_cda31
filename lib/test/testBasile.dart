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
      body: Row(
        children: [
          Image.network(
              width: 100.0,
              height: 100.0,
              "https://media.istockphoto.com/id/1180028723/fr/vectoriel/t%C3%A9l%C3%A9phone-avec-lic%C3%B4ne-de-symbole-dondes-simple-noir-isol%C3%A9-illustration-de-stock-de-vecteur.jpg?s=612x612&w=0&k=20&c=ahgyXeY7RKRUyNR06MhGc4Jti2Ze7KugKT02Yh_hAR4="),
          Expanded(
            child: const Column(
              children: [
                Text(
                  "Titre du twit",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  children:[ Text(
                      "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'en soit modifié. Il a été popularisé dans les années 1960 grâce à la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus récemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.",
                     ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
