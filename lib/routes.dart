import 'package:flutter/material.dart';
import 'package:navigation_route/routes/home_page.dart';
import 'package:navigation_route/routes/random_page.dart';

class RouteGenerator {
// 2.
  static const String homePage = '/';
  static const String randomPage = '/random';
// 3.
  RouteGenerator._();
// 3.
  static Route<dynamic> generateRoute(RouteSettings settings) {
//4.
    switch (settings.name) {
      case homePage:
// .5
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case randomPage:
        return MaterialPageRoute(
          builder: (_) => const RandomPage(),
        );
      default:
        throw FormatException("Route not found");
    }
  }
}

// 5.
class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}
