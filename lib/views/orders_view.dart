import 'package:flutter/material.dart';
import 'package:myapp/core/app_theme.dart';
import 'package:myapp/domain/entities/order.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  _OrdersView createState() => _OrdersView();
}

class _OrdersView extends State<OrdersView> {
  // Mover la lista de órdenes fuera del método build para que persistan los cambios
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.client,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    order.store,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Estado: ${order.state.toString().split('.').last}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: order.state == OrderState.delivered
                          ? null
                          : () {
                              setState(() {
                                order.changeState(
                                  order.state == OrderState.pending
                                      ? OrderState.onTheWay
                                      : OrderState.delivered,
                                );
                              });
                            },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        backgroundColor: order.state == OrderState.delivered
                            ? Colors.grey
                            : AppTheme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        order.state == OrderState.delivered
                            ? 'Aceptado'
                            : 'Aceptar',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
