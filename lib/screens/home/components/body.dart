import 'package:flutter/material.dart';
import 'package:flutter_amqp/receiver_amqp.dart';

class Body extends StatelessWidget {
  final String message;
  const Body({
    Key? key,
    required this.message,
  }) : super(key: key);

  // TODO: adicionar como parâmetro a mensagem recebida do AMQP.

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
