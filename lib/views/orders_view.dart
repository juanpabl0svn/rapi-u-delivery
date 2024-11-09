import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/app_theme.dart';
import 'package:myapp/domain/entities/order.dart';
import 'package:myapp/infraestructure/providers/state_provider.dart';

class OrdersView extends ConsumerStatefulWidget {
  const OrdersView({super.key});

  @override
  _OrdersView createState() => _OrdersView();
}

class _OrdersView extends ConsumerState<OrdersView> {
  @override
  Widget build(BuildContext context) {
    final List<Order> orders = ref
        .watch(appStateProvider)
        .orders
        .where((order) => order.state == OrderState.pending)
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: orders.length < 1 ? const Center(
        child: Text('No hay pedidos pendientes'),
      ) : ListView.builder(
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
                    child: order.state == OrderState.onTheWay
                        ? const Icon(
                            Icons.delivery_dining,
                            color: Colors.green,
                          )
                        : ElevatedButton(
                            onPressed: order.state == OrderState.delivered
                                ? null
                                : () {
                                    setState(() {
                                      order.changeState(
                                        order.state == OrderState.pending
                                            ? OrderState.onTheWay
                                            : OrderState.pending,
                                      );
                                    });
                                  },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              backgroundColor:
                                  order.state == OrderState.delivered
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
