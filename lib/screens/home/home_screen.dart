import 'package:flutter/material.dart';
import 'package:flutter_amqp/screens/home/components/appbar.dart';
import 'package:flutter_amqp/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const Body(),
    );
  }
}