void main() {
  int age = 18;
  print(age);

  //typage optionnel avec le var, à éviter en cas de nullité potentielle
  var age2 = null;
  print(age2);

  var firstname = "Sylvain"; // String firstname = "Sylvain"

  //utilisation du const
  const lastname = "TROPEE";
  //lastname = "autre"; ne fonctionne pas

  //gestion de la nullité

  String? name ;

  print(name);
  //? conditionne l'appel afin d'éviter les erreurs
  print(name?.toUpperCase());
  //! force la variable non null et peut déclenché une erreur
  print(name!.toUpperCase());

}
