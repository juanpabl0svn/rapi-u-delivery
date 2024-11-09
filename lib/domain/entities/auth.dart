import 'package:myapp/domain/entities/delivery.dart';

class Auth {
  final bool isAuthenticated;
  final Delivery? session;

  Auth({this.isAuthenticated = false, this.session});

  Auth copyWith({bool? isAuthenticated, Delivery? session}) {
    return Auth(isAuthenticated: isAuthenticated ?? this.isAuthenticated, session: session ?? this.session);
  }
}
