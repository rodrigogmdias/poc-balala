import 'package:flutter/material.dart';

import '../abstracts/converter.dart';

class TextConverter extends Converter {
  @override
  String name() {
    return "Text";
  }

  @override
  Map<String, WidgetProps> definedProps() {
    return {
      "data": const WidgetProps(
        type: String,
        defaultValue: "Text",
        isRequired: true,
      ),
      "maxLines": const WidgetProps(
        type: int,
      ),
      "textAlign": const WidgetProps(
        type: TextAlign,
        allowedValues: {
          "start": TextAlign.start,
          "end": TextAlign.end,
          "center": TextAlign.center,
          "justify": TextAlign.justify,
        },
      ),
      "overflow": const WidgetProps(
        type: TextOverflow,
        allowedValues: {
          "clip": TextOverflow.clip,
          "ellipsis": TextOverflow.ellipsis,
          "fade": TextOverflow.fade,
        },
      ),
      "color": const WidgetProps(
        type: Color,
      ),
    };
  }

  @override
  Widget makeWidget(dynamic props) {
    return Text(
      coreWidget("data", props),
      maxLines: coreWidget("maxLines", props),
      textAlign: coreWidget("textAlign", props),
      overflow: coreWidget("overflow", props),
    );
  }
}
