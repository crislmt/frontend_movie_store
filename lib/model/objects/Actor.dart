class Actor{
  int id;
  String name;

  Actor({this.id, this.name});

  factory Actor.fromJson(Map<String, dynamic> json){
    return Actor(
        id: json["id"],
        name: json["name"]
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}