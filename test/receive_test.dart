import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_amqp/receiver_amqp.dart';

void main() {
  test('Should return message', () async {
    String message = await receive();
    debugPrint(message);
  });
}