import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/app_theme.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  // Controladores de texto para simular la información del repartidor
  final String nombreRepartidor = "Nombre Repartidor";
  final String infoRepartidor = "Información repartidor\n(que estudia)";

  @override
  Widget build(BuildContext context) {
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
              nombreRepartidor,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 46),
            // Información del repartidor (que estudia)
            Text(
              infoRepartidor,
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
