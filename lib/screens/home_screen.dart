import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Welcome to the home screen!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the login screen
          context.pop();
        },
        child: const Icon(Icons.back_hand),
      ),
    );
  }
}
