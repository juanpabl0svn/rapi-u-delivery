import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/app_theme.dart';
import 'package:myapp/views/views.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  final screens = [
    const OrdersView(),
    const MyOrdersView(),
    const ProfileView(),
    const SettingsView()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rapi U - Delivery',
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
              icon: Icon(Icons.delivery_dining, color: AppTheme.primaryColor),
              label: 'Settings'),
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
