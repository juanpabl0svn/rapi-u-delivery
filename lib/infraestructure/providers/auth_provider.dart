import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/domain/entities/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = StateNotifierProvider<AuthNotifier, Auth>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<Auth> {
  AuthNotifier() : super(Auth()) {
    checkLoggedInStatus();
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isAuthenticated: true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    return true;
  }

  void logout() {
    state = state.copyWith(isAuthenticated: false, session: null);
  }

  Future<void> checkLoggedInStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('email');

    if (token != null) {
      state = state.copyWith(
          isAuthenticated: true); // Si hay token, cambiar el estado a logged in
    }
  }
}
