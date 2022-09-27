import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_amqp/services/receiver_amqp.dart';
import 'package:flutter_amqp/theme/constants.dart';

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
                  style: defaultText,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            Future.delayed(
              Duration.zero,
              () => _dialog(context),
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
      future: receive(),
    );
  }

  void _dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification'),
          content: Column(
            children: [
              const Text('Notification content here'),
              MaterialButton(
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.red,
                child: const Text('Close'),
              ),
            ],
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 100,
          ),
        );
      },
    );
  }
}
