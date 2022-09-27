import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Keys should NOT be equal', () {
    UniqueKey uniqueKey1 = UniqueKey();
    UniqueKey uniqueKey2 = UniqueKey();

    expect(uniqueKey1 != uniqueKey2, true);
  });
}
