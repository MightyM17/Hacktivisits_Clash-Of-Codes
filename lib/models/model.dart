class User {
  final String id;
  final String name;
  final String email;
  var pref = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

  User({
    required this.id,
    required this.name,
    required this.email,
    //required this.pref,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'pref': pref,
  };
}