import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whizapp/core/core.dart';

void main() {
  test('Converter makeWidget with null props', () {
    final core = Core();
    final widget = core.makeWidget("Container", null);
    expect(widget, isA<Container>());
  });
}
