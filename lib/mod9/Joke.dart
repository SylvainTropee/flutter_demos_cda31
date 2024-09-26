
class Joke{

  String? id;
  DateTime? dateCreated;
  String? icon;
  String? content;

  Joke(this.id, this.dateCreated, this.icon, this.content);

  Joke.fromJson(Map<String, dynamic> json){
    id = json['id'];
    icon = json['icon_url'];
    content = json['value'];
  }
  
}