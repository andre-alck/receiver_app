import 'package:dart_amqp/dart_amqp.dart';
import 'dart:io';

void receive() async {
  Client client = Client();
  ProcessSignal.sigint.watch().listen((message) async {
    await client.close();
    exit(0);
  });

  Channel channel = await client.channel();
  Queue queue = await channel.queue('topic');
  Consumer consumer = await queue.consume();

  consumer.listen((message) {
    print('message_received:\t${message.payloadAsString}');
  });
}