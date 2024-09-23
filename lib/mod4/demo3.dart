class Boat {
  bool hasKeel = false;
  String name = "";
  double length = 0;
  int? speedMax;

  Boat(
      {required this.name,
      required this.length,
      this.hasKeel = false,
      this.speedMax});

  //constructeur nommé
  Boat.fromJson(Map<String, dynamic> json){
    name = json['name'];
    length = json['length'];
  }

  @override
  String toString() {
    return "Le bateau $name d'une longueur de $length pieds. "
        "${speedMax != null ? "Vitesse Max = $speedMax" : ""} "
        "${hasKeel ? "Quille = Vrai" : "Quille = Faux"}";
  }
}

void main() {
  Boat b = Boat(name: "Titanic", length: 883, hasKeel: true, speedMax: 150);
  print(b);

  var b2 = Boat.fromJson({"name" : "L'étoile du roy", "length" : 151.0 });
  print(b2);
}
