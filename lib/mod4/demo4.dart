class Sandwich<T> {
  T value;

  Sandwich(this.value);

  T getValue() {
    return value;
  }
}

void main() {
  var s = Sandwich<int>(45);
  print(s.getValue());
  var s2 = Sandwich<String>("Michel");
  print(s2.getValue());

  //utisation des lists DART
  List<int> liste = [1, 2, 3, 4];
  List<bool> liste2 = [true, false, true];

  for(var l in liste){
    print(l);
  }
  //callback
  liste2.forEach((value)  {
    print(value);
  });
}
