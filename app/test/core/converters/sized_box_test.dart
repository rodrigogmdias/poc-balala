import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whizapp/core/core.dart';

void main() {
  test('SizedBox Test Converter', () {
    final core = Core();
    final widget = core.makeWidgetFromJson(
      '{"widget_name":"SizedBox"}',
    );
    expect(widget.runtimeType, SizedBox);
  });

  test('SizedBox Test Converter with props', () {
    final core = Core();
    final widget = core.makeWidgetFromJson(
      '{"widget_name":"SizedBox", "props": {"width": 100, "height": 100}}',
    );
    expect(widget.runtimeType, SizedBox);
    expect((widget as SizedBox).width, 100);
    expect((widget).height, 100);
  });
}
