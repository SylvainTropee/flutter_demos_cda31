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
      home: MyHomePage(title: 'Flutter Demo Form'),
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
      body: DemoForm(),
    );
  }
}

class DemoForm extends StatefulWidget {
  @override
  State<DemoForm> createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  //création d'une clé pour le formulaire
  var formKey = GlobalKey<FormState>();
  bool isFunny = false;
  int gender = 0;
  bool isRadioButtonClicked = true;

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Ce champs ne peut être vide !";
    }

    if (value.length < 2) {
      return "Veuillez saisir au moins 2 caractères !";
    }
    return null;
  }

  String? validateColor(String? value) {
    var colors = ["blue", "red", "yellow"];

    if (value == null) {
      return "Veuillez choisir une couleur";
    }

    if (!colors.contains(value)) {
      return "Couleur non valide !";
    }
    return null;
  }

  String? validateRadio() {
    if (gender == 0) {
      return "Veuillez sélectionner un genre";
    }
    return null;
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {      //si on est là, on peut envoyer vers une API ou autre
    }

    if (gender == 0) {
      setState(() {
        isRadioButtonClicked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //input type text
              TextFormField(
                validator: validateName,
                decoration: InputDecoration(
                    label: Text("Nom"),
                    hintText: "Veuillez saisir votre nom !"),
              ),
              //input type text
              TextFormField(
                decoration: InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
              ),
              //Select input à choix multiple
              DropdownButtonFormField(
                  validator: validateColor,
                  items: [
                    DropdownMenuItem<String>(
                        child: Text("-Choisir une couleur-"), value: null),
                    DropdownMenuItem<String>(
                        child: Text(
                          "Rouge",
                          style: TextStyle(color: Colors.red),
                        ),
                        value: "red"),
                    DropdownMenuItem<String>(
                        child:
                            Container(color: Colors.blue, child: Text("Bleu")),
                        value: "blue"),
                    DropdownMenuItem<String>(
                        child: Text("Jaune"), value: "yellow"),
                  ],
                  onChanged: (value) {}),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Text("T'es drôle ?"),
                    Checkbox(
                        value: isFunny,
                        onChanged: (value) {
                          setState(() {
                            isFunny = !isFunny;
                          });
                        }),
                  ],
                ),
              ),
              Row(
                children: [
                  Radio<int>(
                      value: 1,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      }),
                  Text("Homme"),
                  Radio<int>(
                      value: 2,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      }),
                  Text("Femme"),
                ],
              ),
              if (!isRadioButtonClicked)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    validateRadio() != null ? validateRadio()! : "",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ElevatedButton(onPressed: onSubmit, child: Text("Valider !"))
            ],
          ),
        ));
  }
}
