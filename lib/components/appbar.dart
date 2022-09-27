import 'package:flutter/material.dart';
import 'package:flutter_amqp/screens/home/home_screen.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    title: const Text('Advanced Message Queuing Protocol'),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.home, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
      ),
    ],
    automaticallyImplyLeading: false,
  );
}
