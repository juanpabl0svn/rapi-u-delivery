import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:myapp/core/fetch.dart';
import 'package:myapp/domain/entities/auth.dart';
import 'package:myapp/domain/entities/delivery.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = StateNotifierProvider<AuthNotifier, Auth>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<Auth> {
  AuthNotifier() : super(Auth()) {
    checkLoggedInStatus();
  }

  Future<bool> login(String email, String password) async {
    final Response user = await Fetch().POST('/delivery/login', {
      'email': email,
      'password': password,
    });

    if (user.statusCode != 200) {
      return false;
    }
    Delivery delivery = Delivery.fromJson(jsonDecode(user.body));
    state = state.copyWith(isAuthenticated: true, session: delivery);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', delivery.id.toString());
    return true;
  }

  void logout() {
    state = state.copyWith(isAuthenticated: false, session: null);
  }

  Future<void> checkLoggedInStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('id');

    if (token != null) {
      final Response user = await Fetch().GET('/delivery/$token');
      if (user.statusCode != 200) {
        state = state.copyWith(isAuthenticated: false, session: null);
        return;
      }
      Delivery delivery = Delivery.fromJson(jsonDecode(user.body));
      state = state.copyWith(isAuthenticated: true, session: delivery);
    }
  }
}
