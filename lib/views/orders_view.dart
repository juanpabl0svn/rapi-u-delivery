import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/app_theme.dart';

// Definir un modelo básico para representar los pedidos
class Pedido {
  final String info;
  final bool isAccepted;

  Pedido({required this.info, this.isAccepted = false});
}

// Un provider de estado para gestionar los pedidos activos
final pedidosProvider =
    StateNotifierProvider<PedidosNotifier, List<Pedido>>((ref) {
  return PedidosNotifier();
});

// Notifier para actualizar el estado de los pedidos
class PedidosNotifier extends StateNotifier<List<Pedido>> {
  PedidosNotifier()
      : super([
          Pedido(info: 'Información pedido 1'),
          Pedido(info: 'Información pedido 2'),
          Pedido(info: 'Información pedido 3'),
          Pedido(info: 'Información pedido 4'),
        ]);

  // Método para aceptar un pedido
  void aceptarPedido(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          Pedido(info: state[i].info, isAccepted: true)
        else
          state[i]
    ];
  }
}

// ConsumerStatefulWidget que representa la vista de "Ver pedidos activos"
class OrdersView extends ConsumerStatefulWidget {
  const OrdersView({super.key});

  @override
  _OrdersView createState() => _OrdersView();
}

class _OrdersView extends ConsumerState<OrdersView> {
  @override
  Widget build(BuildContext context) {
    final pedidos = ref.watch(pedidosProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: pedidos.length,
        itemBuilder: (context, index) {
          final pedido = pedidos[index];
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
                    pedido.info,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: pedido.isAccepted
                          ? null // Si el pedido ya fue aceptado, el botón está deshabilitado
                          : () {
                              ref
                                  .read(pedidosProvider.notifier)
                                  .aceptarPedido(index);
                            },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        backgroundColor: pedido.isAccepted
                            ? Colors.grey
                            : AppTheme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        pedido.isAccepted ? 'Aceptado' : 'Aceptar',
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
