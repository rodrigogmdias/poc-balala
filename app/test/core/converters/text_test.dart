import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whizapp/core/core.dart';

void main() {
  test('Text Test Converter', () {
    final core = Core();
    final widget = core.makeWidgetFromJson(
      '{"widget_name":"Text"}',
    );
    expect(widget.runtimeType, Text);
  });
}
