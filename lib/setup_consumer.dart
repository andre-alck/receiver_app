import 'dart:async';
import 'dart:io';

import 'package:dart_amqp/dart_amqp.dart';

Future<Consumer> setupConsumer() async {
  ConnectionSettings settings = ConnectionSettings(
    maxConnectionAttempts: 5,
  );

  Client client = Client(settings: settings);
  ProcessSignal.sigint.watch().listen((message) async {
    await client.close();
    exit(0);
  });

  Channel channel = await client.channel();
  Exchange exchange = await channel.exchange('logs', ExchangeType.FANOUT);
  Consumer consumer = await exchange.bindPrivateQueueConsumer(null);

  return consumer;
}
