import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_amqp/components/show_notification.dart';
import 'package:flutter_amqp/services/receiver_amqp.dart';
import 'package:flutter_amqp/theme/constants.dart';

class AMQPScreen extends StatefulWidget {
  const AMQPScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AMQPScreen> createState() => _AMQPScreenState();
}

class _AMQPScreenState extends State<AMQPScreen> {
  Timer? timer;
  String message = "";

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(
        seconds: 30,
      ),
      (Timer t) {
        setState(() {});
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
              () => showNotification(
                context,
                snapshot.data as String,
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
      future: receive(),
    );
  }

  
}
