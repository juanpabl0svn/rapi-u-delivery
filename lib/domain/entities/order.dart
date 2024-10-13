enum OrderState { pending, onTheWay, delivered }

class Order {
  final int id;
  final String client;
  final String store;
  OrderState state;

  Order({
    required this.id,
    required this.client,
    required this.store,
    this.state = OrderState.pending,
  });

  Order copyWith({OrderState? state}) {
    return Order(
      id: id,
      client: client,
      store: store,
      state: state ?? this.state,
    );
  }
}
