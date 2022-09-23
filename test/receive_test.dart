import 'package:flutter_amqp/receiver_amqp.dart';
import 'package:flutter_amqp/setup_consumer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return message', () async {
    String message = await receive(setupConsumer());
    expect(message, 'new string message!');
  });
}