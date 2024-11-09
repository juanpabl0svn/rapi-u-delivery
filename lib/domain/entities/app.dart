// app_state.dart
import 'package:myapp/domain/entities/order.dart';

class AppState {
  final List<Order> orders;

  final List<Order> my_orders = [];

  AppState({required this.orders});

  AppState copyWith({List<Order>? orders}) {
    return AppState(
      orders: orders ?? this.orders,
    );
  }
}
