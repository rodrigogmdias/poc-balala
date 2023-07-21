import 'package:flutter/material.dart';

import '../abstracts/converter.dart';

class SizedBoxConverter extends Converter {
  @override
  String name() {
    return "SizedBox";
  }

  @override
  Map<String, WidgetProps> definedProps() {
    return {
      "width": const WidgetProps(
        type: double,
        defaultValue: 0.0,
      ),
      "height": const WidgetProps(
        type: double,
        defaultValue: 0.0,
      ),
    };
  }

  @override
  Widget makeWidget(dynamic props) {
    return SizedBox(
      width: coreWidget("width", props),
      height: coreWidget("height", props),
    );
  }
}
