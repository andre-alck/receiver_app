import 'dart:async';
import 'dart:io';

import 'package:dart_amqp/dart_amqp.dart';

Future<String> receive() async {
  Client client = Client();
  ProcessSignal.sigint.watch().listen((event) async {
    await client.close();
    exit(0);
  });

  Channel channel = await client.channel();
  Exchange exchange = await channel.exchange('logs', ExchangeType.FANOUT);
  Consumer consumer = await exchange.bindPrivateQueueConsumer(null);

  final Completer<String> completer = Completer<String>();
  consumer.listen(
      (AmqpMessage message) => completer.complete(message.payloadAsString));

  return completer.future;
}