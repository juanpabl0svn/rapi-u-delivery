import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/domain/entities/app.dart';
import 'package:myapp/domain/entities/order.dart';

final appStateProvider =
    StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier();
});

class AppStateNotifier extends StateNotifier<AppState> {
  final List<Order> orders = [
    Order(
        id: 1, client: 'Pedro', store: 'Donde Tavo', state: OrderState.pending),
    Order(
        id: 2, client: 'Juan', store: 'Donde Dari', state: OrderState.pending),
    Order(
        id: 3,
        client: 'Maria',
        store: 'Señor Gourmet',
        state: OrderState.delivered),
  ];

  final List<Order>? my_orders = null;

  AppStateNotifier() : super(AppState()) {}

  void changeOrderState(Order order, OrderState newState) {
    final index = orders.indexWhere((element) => element.id == order.id);
    if (index != -1) {
      orders[index] = order.copyWith(state: newState);
      state = state.copyWith();
    }
  }
}
