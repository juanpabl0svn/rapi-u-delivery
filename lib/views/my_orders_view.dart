import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:myapp/core/app_theme.dart';
import 'package:myapp/domain/entities/delivery.dart';
import 'package:myapp/domain/entities/order.dart';
import 'package:myapp/infraestructure/providers/auth_provider.dart';
import 'package:myapp/infraestructure/providers/state_provider.dart';

class MyOrdersView extends ConsumerWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Delivery delivery = ref.watch(authProvider).session!;

    final List<Order> orders = ref
        .watch(appStateProvider)
        .orders
        .where((order) =>
            order.delivery?.id == delivery.id &&
            order.state == OrderState.onTheWay)
        .toList();

    return Column(
      children: [
        const SizedBox(height: 16),
        const Text(
          'Mis Pedidos',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Padding(
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
                          order.user.firstName + ' ' + order.user.lastName,
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
                        Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.delivery_dining,
                                color: AppTheme.primaryColor)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
