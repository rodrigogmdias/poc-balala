import 'package:flutter/material.dart';

import '../abstracts/converter.dart';

class ContainerConverter extends Converter {
  @override
  String name() {
    return "Container";
  }

  @override
  Map<String, WidgetProps> definedProps() {
    return {
      "child": const WidgetProps(
        type: Widget,
      ),
      "color": const WidgetProps(
        type: Color,
      ),
    };
  }

  @override
  Widget makeWidget(dynamic props) {
    return Container(
      child: coreWidget("child", props),
      color: coreWidget("color", props),
    );
  }
}
