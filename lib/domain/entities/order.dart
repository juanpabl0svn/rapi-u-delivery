enum OrderState { pending, onTheWay, delivered }

class Order {
  final int id;
  final String client;
  final String store;
  OrderState state;
  final int? idDelivery;

  Order({
    required this.id,
    required this.client,
    required this.store,
    this.idDelivery,
    this.state = OrderState.pending,
  });

  factory Order.fromJson(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      client: map['client'],
      store: map['store'],
      state: OrderState.values[map['state']],
    );
  }

  void changeState(OrderState newState) {
    state = newState;
  }

  Order copyWith({OrderState? state}) {
    return Order(
      id: id,
      client: client,
      store: store,
      state: state ?? this.state,
    );
  }
}
