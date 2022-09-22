import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_amqp/receiver_amqp.dart';

class AMQP extends StatefulWidget {
  const AMQP({
    Key? key,
  }) : super(key: key);

  @override
  State<AMQP> createState() => _AMQPState();
}

class _AMQPState extends State<AMQP> {
  Timer? timer;
  String? message;

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (Timer t) async {
        message = await receive();
        setState(() {
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text( // TODO: passar argumento "message" para route body
        '$message',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
