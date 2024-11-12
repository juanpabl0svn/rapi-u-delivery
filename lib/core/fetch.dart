import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Fetch {
  final String url = "https://rappi-u-api.onrender.com";

  Future<Response> POST(String endpoint, Map<String, dynamic> body) {
    Uri uri = Uri.parse(url + endpoint);
    return http
        .post(uri, body: json.encode(body), headers: {"Content-Type": "application/json"});
  }

  Future<Response> GET(String endpoint) {
    Uri uri = Uri.parse(url + endpoint);
    return http.get(uri);
  }

// Suggested code may be subject to a license. Learn more: ~LicenseLog:2656205200.
  Future<Response> DELETE(String endpoint) {
    Uri uri = Uri.parse(url + endpoint);
    return http.delete(uri);
  }

  Future<Response> PUT(String endpoint, Map<String, dynamic> body) {
    Uri uri = Uri.parse(url + endpoint);
    return http
        .put(uri, body: json.encode(body), headers: {"Content-Type": "application/json"});
  }

  Future<Response> PATCH(String endpoint, Map<String, dynamic> body) {
    Uri uri = Uri.parse(url + endpoint);
    return http
        .patch(uri, body: json.encode(body), headers: {"Content-Type": "application/json"});
  }
}
