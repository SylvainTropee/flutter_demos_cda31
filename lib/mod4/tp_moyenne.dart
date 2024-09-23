class Lesson {
  String name;
  List<double> notes;

  Lesson({required this.name, required this.notes});

  double getAverage() {
    double sum = 0.0;

    for (double note in notes) {
      sum += note;
    }

    double average = sum / notes.length;
    print("La moyenne de la matière $name est ${average.toStringAsFixed(2)}");
    return average;
  }
}


void main(){

  List<Lesson> lessons = [
    Lesson(name: "Français", notes: [12.25, 15, 2]),
    Lesson(name: "Maths", notes: [18.5, 15, 8, 0]),
    Lesson(name: "Informatique", notes: [20, 19.5, 5]),
  ];

  double totalAverage = getTotalAverage(lessons);
  print("La moyenne générale est de ${totalAverage.toStringAsFixed(2)}");

}


double getTotalAverage(List<Lesson> lessons){

  double sum = 0.0;

  lessons.forEach((Lesson lesson){
    sum += lesson.getAverage();
  });

  return sum / lessons.length;
}










