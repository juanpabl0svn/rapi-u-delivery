import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/domain/entities/delivery.dart';
import 'package:myapp/infraestructure/providers/auth_provider.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1627363834.

  @override
  Widget build(BuildContext context) {
    Delivery delivery = ref.watch(authProvider).session!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen de perfil con borde circular
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            // Nombre del repartidor
            Text(
              delivery.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 46),
            // Información del repartidor (que estudia)
            Text(
              delivery.email,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              delivery.cc == "" ? "Falta cedula" : delivery.cc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
