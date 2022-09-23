import 'dart:async';

import 'package:dart_amqp/dart_amqp.dart';

Future<String> receive(Future<Consumer> fConsumer) async {
  Consumer consumer = await fConsumer;

  final Completer<String> completer = Completer<String>();
  consumer.listen(
      (AmqpMessage message) => completer.complete(message.payloadAsString));

  return completer.future;
}