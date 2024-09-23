void wait2SecondsbeforePrint() async {
  print("avant l'attente");
  await Future.delayed(Duration(seconds: 3));
  print("après l'attente");
}

Future<String> getAsyncName() async {
  print("avant Michel");
  await Future.delayed(Duration(seconds: 2));
  return "Michel";
}

void main() async {
  wait2SecondsbeforePrint();
  String name = await getAsyncName();
  print(name);
}
