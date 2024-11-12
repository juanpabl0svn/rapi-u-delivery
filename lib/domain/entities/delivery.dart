class Delivery {
  final int id;
  final String name;
  final String email;
  final String cc;

  Delivery({
    required this.id,
    required this.name,
    required this.email,
    required this.cc
  });

  factory Delivery.fromJson(Map<String, dynamic> map) {
    return Delivery(
      id: map['idDelivery'],
      name: map['firstName'] + ' ' + map['lastName'],
      email: map['email'],
      cc: map['cc'],
    );
  }

  Delivery copyWith({
    String? name,
    String? email,
    String? cc
  }) {
    return Delivery(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      cc: cc ?? this.cc,
    );
  }

  @override
  String toString() {
    return 'Delivery {id: $id, name: $name, email: $email';
  }
}
