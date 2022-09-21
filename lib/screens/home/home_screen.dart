import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    title: const Text('AMQP'),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar()
    );
  }
}