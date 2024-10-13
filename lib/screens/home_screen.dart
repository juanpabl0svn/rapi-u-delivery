import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/app_theme.dart';
import 'package:myapp/views/orders_view.dart';
import 'package:myapp/views/profilie_view.dart';
import 'package:myapp/views/settings_view.dart';

// ConsumerStatefulWidget que representa la vista de "Ver pedidos activos"
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  final screens = [
    const OrdersView(),
    const ProfileView(),
    const SettingsView()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ver pedidos activos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: AppTheme.primaryColor),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: AppTheme.primaryColor),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: AppTheme.primaryColor),
              label: 'Settings')
        ],
        onTap: (value) => setState(() => currentIndex = value),
      ),
    );
  }
}
