import 'package:flutter_amqp/services/receiver_amqp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return message', () async {
    String message = await receive();
    expect(message, 'new string message!');
  });
}