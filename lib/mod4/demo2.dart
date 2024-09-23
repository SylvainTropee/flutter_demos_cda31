
void main(){
  display();
  displayMessage(message3: "xworld", message: "Hello");
}

void display(){
  print(getMessage());
}

void displayMessage({required String message,  String? message2,  String? message3}){
  print("Hello ${message.toUpperCase()}");
}


String getMessage(){
  return "Hello World !";
}