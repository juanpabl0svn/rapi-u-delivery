// app_state.dart
import 'package:myapp/domain/entities/order.dart';

class AppState {
  final List<Order> orders;


  // ignore: non_constant_identifier_names
  AppState({ required this.orders});

  get session => null;

  AppState copyWith({List<Order>? orders}) {
    return AppState(
      orders: orders ?? this.orders,
    );
  }
}
