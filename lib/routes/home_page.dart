import 'package:flutter/material.dart';
import 'package:navigation_route/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
// ignore: deprecated_member_use
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context)?.pushNamed(RouteGenerator.randomPage);
          },
          child: const Text("Random"),
        ),
      ),
    );
  }
}
