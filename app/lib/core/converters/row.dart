import 'package:flutter/material.dart';

import '../abstracts/converter.dart';

class RowConverter extends Converter {
  @override
  String name() {
    return "Row";
  }

  @override
  Map<String, WidgetProps> definedProps() {
    return {
      "children": const WidgetProps(
        type: List<Widget>,
        isRequired: true,
      ),
      "mainAxisAlignment": const WidgetProps(
        type: MainAxisAlignment,
        defaultValue: MainAxisAlignment.start,
        allowedValues: {
          "start": MainAxisAlignment.start,
          "end": MainAxisAlignment.end,
          "center": MainAxisAlignment.center,
          "spaceBetween": MainAxisAlignment.spaceBetween,
          "spaceAround": MainAxisAlignment.spaceAround,
          "spaceEvenly": MainAxisAlignment.spaceEvenly,
        },
      ),
    };
  }

  @override
  Widget makeWidget(dynamic props) {
    return Row(
      children: coreWidget("children", props),
      mainAxisAlignment: coreWidget("mainAxisAlignment", props),
    );
  }
}
