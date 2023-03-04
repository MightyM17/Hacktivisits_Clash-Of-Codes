class Person{
  String? key;
  PersonData? personData;

  Person({this.key,this.personData});
}

class PersonData{
  Map<String, String>? books;
  Map<String, String>? fav;

  PersonData({this.books, this.fav});

  PersonData.fromJson(Map<dynamic,dynamic> json){
    books = json["books"];
    books = json["fav"];
  }
}