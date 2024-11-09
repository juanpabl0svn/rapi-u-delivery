
import 'package:myapp/domain/entities/order.dart';

class AppState {

  final List<Order> orders = [];

  final List<Order> history = [];

  


  AppState();


  void addOrder(Order order) {
    orders.add(order);
  }

  AppState copyWith() {
    return AppState();
  }





}
