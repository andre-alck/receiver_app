import 'package:flutter/material.dart';
import 'package:flutter_amqp/components/appbar.dart';
import 'package:flutter_amqp/theme/constants.dart';

class DetailsScreen extends StatelessWidget {
  final String message;

  const DetailsScreen({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  Center body() {
    return Center(
      child: Text(
        message,
        style: defaultText,
      ),
    );
  }
}
