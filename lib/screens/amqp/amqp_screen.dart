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
  String message = "";

  @override
  void initState() {
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
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return Container(
              color: Colors.yellow,
              child: Center(
                child: Text(
                  '${snapshot.data}',
                ),
              ),
            );
          } else {
            return Container(
              color: Colors.purple,
              child: const Center(
                child: Text(
                  'No data.',
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
      future: checkMessages(),
    );
  }

  Future<String> checkMessages() async {
    String message = await receive();

    return message;
  }
}
