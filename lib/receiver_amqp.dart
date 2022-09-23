import 'package:dart_amqp/dart_amqp.dart';
import 'dart:io';

Future<String> receive() async {
  ConnectionSettings settings = ConnectionSettings(
    maxConnectionAttempts: 5,
  );

  Client client = Client(settings: settings);
  ProcessSignal.sigint.watch().listen((message) async {
    await client.close();
    exit(0);
  });

  Channel channel = await client.channel();
  Queue queue = await channel.queue('topic');
  Consumer consumer = await queue.consume();

  String messageReceived = "";

  consumer.listen((AmqpMessage message) {
    messageReceived = message.payloadAsString;
    print('message_received:\t${message.payloadAsString}');
  });

  return messageReceived;
}

Future<String> asyncFoo() {
  return Future.delayed(const Duration(seconds: 2), () {
    return "I am data";
  });
}