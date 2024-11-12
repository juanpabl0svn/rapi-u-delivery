// app_state.dart
import 'package:myapp/domain/entities/order.dart';

class AppState {
  final List<Order> orders;

  final List<Order> my_orders;

  // ignore: non_constant_identifier_names
  AppState({this.my_orders = const [] , required this.orders});

  get session => null;

  AppState copyWith({List<Order>? orders, List<Order>? my_orders}) {
    return AppState(
      orders: orders ?? this.orders,
    );
  }
}
