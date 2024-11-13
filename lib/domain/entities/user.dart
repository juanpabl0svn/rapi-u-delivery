class User {
  int user_id;
  String firstName;
  String lastName;
  String cc;
  String email;

  User({
    required this.user_id,
    required this.firstName,
    required this.lastName,
    required this.cc,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      user_id: map['idUser'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      cc: map['cc'] ?? "",
      email: map['email'],
    );
  }




}
