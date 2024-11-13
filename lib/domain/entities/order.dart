import 'dart:ffi';

import 'package:myapp/domain/entities/delivery.dart';
import 'package:myapp/domain/entities/user.dart';

enum OrderState { pending, onTheWay, delivered, canceled }

class Order {
  final int id;
  final Delivery? delivery;
  final User user;
  OrderState state;
  final String observation;
  final Float total;
  final String location;

  Order({
    required this.id,
    required this.delivery,
    required this.user,
    required this.state,
    required this.observation,
    required this.total,
    required this.location,
  });


  factory Order.fromJson(Map<String, dynamic> map) {
    return Order(
      id: map['idOrder'],
      delivery: map["delivery"] != null ? Delivery.fromJson(map['delivery']) : null,
      state: OrderState.values(map['status']) ?? OrderState.pending,
      observation: map['observation'],
      total: map['total'],
      location: map['location'],
      user: User.fromJson(map['user']),
    );
  }

  void changeState(OrderState newState) {
    state = newState;
  }

  Order copyWith({OrderState? state, Delivery? delivery}) {
    return Order(
      id: id,
      delivery: delivery ?? this.delivery,
      user: user,
      state: state ?? this.state,
      observation: observation,
      total: total,
      location: location,
    );
  }
}
