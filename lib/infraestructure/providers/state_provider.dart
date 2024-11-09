// app_state_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/domain/entities/app.dart';
import 'package:myapp/domain/entities/order.dart';

final appStateProvider =
    StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier();
});

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState(orders: [])) {
    getOrders();
  }

  void changeOrderState(Order order, OrderState newState) {
    final updatedOrders = state.orders.map((o) {
      if (o.id == order.id) {
        return o.copyWith(state: newState);
      }
      return o;
    }).toList();
    state = state.copyWith(orders: updatedOrders);
  }

  void getOrders() {
    state = state.copyWith(orders: [
      Order(
          id: 1,
          client: 'Pedro',
          store: 'Donde Tavo',
          state: OrderState.pending),
      Order(
          id: 2,
          client: 'Juan',
          store: 'Donde Dari',
          state: OrderState.pending),
      Order(
          id: 3,
          client: 'Maria',
          store: 'Señor Gourmet',
          state: OrderState.delivered),
    ]);
  }
}
