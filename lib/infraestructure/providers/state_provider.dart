// app_state_provider.dart
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:myapp/core/fetch.dart';
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

  void setToMyOrders(Order order) {
    final updatedMyOrders = state.my_orders;
    updatedMyOrders.add(order);
    state = state.copyWith();
  }

  void getOrders() async {
    Response req = await Fetch().GET("/order");

    if (req.statusCode != 200) {
      return;
    }

    List<Order> orders = (json.decode(req.body) as List)
        .map((order) => Order.fromJson(order))
        .toList();

    state = state.copyWith(orders: orders);
  }
}
