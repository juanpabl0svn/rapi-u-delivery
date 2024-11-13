import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:myapp/core/app_theme.dart';
import 'package:myapp/domain/entities/delivery.dart';
import 'package:myapp/domain/entities/order.dart';
import 'package:myapp/infraestructure/providers/auth_provider.dart';
import 'package:myapp/infraestructure/providers/state_provider.dart';

class OrdersHistoryView extends ConsumerStatefulWidget {
  const OrdersHistoryView({super.key});

  @override
  _OrdersHistoryView createState() => _OrdersHistoryView();
}

class _OrdersHistoryView extends ConsumerState<OrdersHistoryView> {
  @override
  Widget build(BuildContext context) {
    final Delivery delivery = ref.watch(authProvider).session!;

    final List<Order> orders = ref
        .watch(appStateProvider)
        .orders
        .where((order) =>
            order.state == OrderState.delivered &&
            order.delivery?.id == delivery.id)
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: orders.isEmpty
          ? const Center(
              child: Text('No has terminado ningun pedido'),
            )
          : ListView.builder(
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
                          order.location,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          NumberFormat.currency(locale: 'es_CO', symbol: '\$')
                              .format(order.total),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Estado: ${order.state.toString().split('.').last}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.delivery_dining_rounded),
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
