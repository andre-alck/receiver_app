import 'dart:async';

import 'package:dart_amqp/dart_amqp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amqp/constants.dart';
import 'package:flutter_amqp/receiver_amqp.dart';
import 'package:flutter_amqp/setup_consumer.dart';

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
  late Future<Consumer> consumer;

  @override
  void initState() {
    consumer = setupConsumer();

    timer = Timer.periodic(
      const Duration(
        seconds: 30,
      ),
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
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Container(
              color: Colors.red,
              child: Center(
                child: Text(
                  '${snapshot.error}',
                  style: defaultText,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return Container(
              color: Colors.yellow,
              child: Center(
                child: Text(
                  '${snapshot.data}',
                  style: defaultText,
                ),
              ),
            );
          } else {
            return Container(
              color: Colors.purple,
              child: Center(
                child: Text(
                  'No data.',
                  style: defaultText,
                ),
              ),
            );
          }
        }

        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
          ),
        );
      },
      future: receive(consumer),
    );
  }
}
