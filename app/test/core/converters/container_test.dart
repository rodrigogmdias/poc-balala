import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whizapp/core/core.dart';

void main() {
  test('Container Test Converter', () {
    final core = Core();
    final widget = core.makeWidgetFromJson(
      '{"widget_name":"Container"}',
    );
    expect(widget.runtimeType, Container);
  });

  test('Container Test Converter with props', () {
    final core = Core();
    final widget = core.makeWidgetFromJson(
      '{"widget_name":"Container", "props": {"color": "#FF0000"}}',
    );
    expect(widget.runtimeType, Container);
    expect((widget as Container).color, const Color(0xFFFF0000));
  });
}
