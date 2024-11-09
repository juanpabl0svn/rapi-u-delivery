import 'package:go_router/go_router.dart';
import 'package:myapp/infraestructure/providers/auth_provider.dart';
import 'package:myapp/screens/screens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final isAuthenticated = ref.watch(authProvider).isAuthenticated;

  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            isAuthenticated ? const HomeScreen() : const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) =>
            isAuthenticated ? const HomeScreen() : const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
    redirect: (context, state) {
      return null;
    },
  );
});
