import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/app_theme.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ListTile(
          leading: const Icon(Icons.person, color: AppTheme.primaryColor),
          title: const Text('Perfil'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            context.go('/perfil');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.history, color: AppTheme.primaryColor),
          title: const Text('Historial de Pedidos'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            context.go('/historial-pedidos');
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
