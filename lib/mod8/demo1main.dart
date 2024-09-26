import 'package:flutter/material.dart';
import 'demo1page2.dart';
import 'demo1page1.dart';

void main() {
  runApp(DemoRouting());
}

class Routes {
  //permet d'externaliser le routing
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      "/page-one": (context) => PageOne(),
      "/page-two": (context) => PageTwo()
    };
  }
}

class DemoRouting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //la page par défaut est "/"
      initialRoute: "/page-one",
      routes: Routes.getRoutes(context),
    );
  }
}
