class Dealer {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photoURL; // URL de la foto de perfil del repartidor
  final String studio; // Carrera o curso que el repartidor está estudiando
  final int completedOrders;

  Dealer({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photoURL,
    required this.studio,
    required this.completedOrders,
  });

  // Método para actualizar ciertos campos del repartidor si fuera necesario
  Dealer copyWith({
    String? name,
    String? email,
    String? phone,
    String? photoURL,
    String? studio,
    int? completedOrders,
  }) {
    return Dealer(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      photoURL: photoURL ?? this.photoURL,
      studio: studio ?? this.studio,
      completedOrders: completedOrders ?? this.completedOrders,
    );
  }

  @override
  String toString() {
    return 'Dealer {id: $id, name: $name, email: $email, phone: $phone, studio: $studio, completedOrders: $completedOrders}';
  }
}
