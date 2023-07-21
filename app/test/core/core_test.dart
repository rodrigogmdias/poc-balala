import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:whizapp/core/core.dart';

void main() {
  test('Get object from json string no edit', () {
    final core = Core();
    const json = """
    {
      "widget_name": "Container",
      "props": {
        "color": "#FF0000",
        "width": 100,
        "height": 100
      }
    }
    """;

    final widget = core.makeWidgetFromJson(json);
    expect(widget, isNotNull);
    expect(widget, isA<Container>());
  });

  testWidgets('Get object from json in edit mode', (tester) async {
    final core = Core();
    const json = """
    {
      "widget_name": "Container"
    }
    """;

    final widget = core.makeWidgetFromJson(json, edit: true) as Container;
    await tester.pumpWidget(widget);

    final dratTargetFinder = find.byType(DragTarget);
    expect(widget, isNotNull);
    expect(dratTargetFinder, findsOneWidget);
  });
}
