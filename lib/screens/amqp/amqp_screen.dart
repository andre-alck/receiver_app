import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_amqp/receiver_amqp.dart';
import 'package:flutter_amqp/screens/home/components/body.dart';

class AMQP extends StatefulWidget {
  const AMQP({
    Key? key,
  }) : super(key: key);

  @override
  State<AMQP> createState() => _AMQPState();
}

class _AMQPState extends State<AMQP> {
  Timer? timer;
  String message = "";

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(seconds: 30),
      (Timer t) {
        setState(() {
          // ideia é buildar periodicamente
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    checkMessages(context);

    return const Center(
      child: Text('Simple page'),
    );
  }

  void checkMessages(BuildContext context) async {
    message = await asyncFoo();

    if (message != "") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Body(
            message: message,
          ),
        ),
      );
    }
  }
}
