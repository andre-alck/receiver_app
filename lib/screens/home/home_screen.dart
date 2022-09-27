import 'package:flutter/material.dart';
import 'package:flutter_amqp/screens/amqp/amqp_screen.dart';
import 'package:flutter_amqp/components/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: const AMQPScreen(),
    );
  }
}
