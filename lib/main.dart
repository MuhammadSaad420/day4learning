import 'package:flutter/material.dart';
import 'package:navigation_route/routes.dart';

void main() => runApp(const RandomApp());

// 1.
class RandomApp extends StatelessWidget {
  const RandomApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => "Random App",
      initialRoute: RouteGenerator.homePage, // 2.
      onGenerateRoute: RouteGenerator.generateRoute, // 3.
      debugShowCheckedModeBanner: false,
    );
  }
}
