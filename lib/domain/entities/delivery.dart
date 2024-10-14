class Delivery {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photoURL; 

  Delivery({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photoURL,
  });

  factory Delivery.fromJson(Map<String, dynamic> map) {
    return Delivery(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      photoURL: map['photoURL'],
    );
  }

  Delivery copyWith({
    String? name,
    String? email,
    String? phone,
    String? photoURL,
  }) {
    return Delivery(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  @override
  String toString() {
    return 'Delivery {id: $id, name: $name, email: $email, phone: $phone, studio: $studio, completedOrders: $completedOrders}';
  }
}
