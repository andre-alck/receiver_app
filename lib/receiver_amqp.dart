import 'package:dart_amqp/dart_amqp.dart';
import 'dart:io';

Future<String> receive() async {
  Client client = Client();
  ProcessSignal.sigint.watch().listen((message) async {
    await client.close();
    exit(0);
  });

  Channel channel = await client.channel();
  Queue queue = await channel.queue('topic');
  Consumer consumer = await queue.consume();

  String messageReceived = "";

  consumer.listen((message) {
    messageReceived = message.payloadAsString;
    print('message_received:\t${message.payloadAsString}');
  });

  return messageReceived;
}