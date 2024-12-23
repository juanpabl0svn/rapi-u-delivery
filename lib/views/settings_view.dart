import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/app_theme.dart';
import 'package:myapp/infraestructure/providers/auth_provider.dart';
import 'package:myapp/screens/orders_history_screen.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ListTile(
          leading: const Icon(Icons.history, color: AppTheme.primaryColor),
          title: const Text('Historial de Pedidos'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrdersHistoryView()),
                );
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title:
              const Text('Cerrar Sesión', style: TextStyle(color: Colors.red)),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Confirmar Cerrar Sesión'),
                  content:
                      const Text('¿Estás seguro de que deseas cerrar sesión?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        ref.watch(authProvider.notifier).logout();
                        context.go('/');
                      },
                      child: const Text('Cerrar Sesión'),
                    ),
                  ],
                );
              },
            );
          },
        ),
        const Divider(),
      ],
    );
  }
}
