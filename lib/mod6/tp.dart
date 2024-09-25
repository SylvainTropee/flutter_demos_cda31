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
      home: MyHomePage(title: 'Flutter Tp Produits'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title;

  MyHomePage({required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double total = 0.0;

  final productKey = [
    GlobalKey<_ArticleState>(),
    GlobalKey<_ArticleState>(),
    GlobalKey<_ArticleState>(),
    GlobalKey<_ArticleState>(),
  ];

  double getTotal() {
    total = 0.0;
    setState(() {
      for (var key in productKey) {
        total += key.currentState!.getTotalByArticle();
      }
    });

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Article("Clavier", 50, this, key: productKey[0]),
            Article("Ecran", 250, this, key: productKey[1]),
            Article("Souris", 5.75, this, key: productKey[2]),
            Article("Stylo en or", 77.77, this, key: productKey[3]),
            Text("Total global = ${total}")
          ],
        ));
  }
}

class Article extends StatefulWidget {
  String label;
  double price;
  _MyHomePageState state;

  Article(this.label, this.price, this.state, {Key? key}) : super(key: key);

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  int nb = 0;

  void addArticle() {
    setState(() {
      nb++;
      widget.state.getTotal();
    });
  }

  void removeArticle() {
    if (nb - 1 >= 0) {
      setState(() {
        nb--;
        widget.state.getTotal();
      });
    }
  }

  double getTotalByArticle() {
    return widget.price * nb;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.label),
          Text("${widget.price} €"),
          IconButton(
              onPressed: addArticle,
              icon: Icon(Icons.add),
              color: Colors.white,
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue))),
          Text(nb.toString()),
          FilledButton(
              onPressed: removeArticle,
              child: Icon(Icons.remove),
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blue))),
          Text("Total = ${getTotalByArticle()}")
        ],
      ),
    );
  }
}
