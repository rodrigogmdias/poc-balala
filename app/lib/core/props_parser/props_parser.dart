import 'package:flutter/material.dart';
import '../core.dart';

class PropsParser {
  PropsParser({required this.core, required this.edit});

  final Core core;
  final bool edit;

  dynamic parser(dynamic definedProp, dynamic receivedProp) {
    if (definedProp == null) {
      return null;
    }

    if (receivedProp == null) {
      return edit
          ? _handleReceivedPropNullEdited(definedProp)
          : _handleReceivedPropNull(definedProp);
    }

    if (definedProp.type == String ||
        definedProp.type == int ||
        definedProp.type == double ||
        definedProp.type == bool) {
      return _handlePrimitiveTypes(definedProp, receivedProp);
    }

    if (definedProp.allowedValues != null) {
      return _handleAllowedValues(definedProp, receivedProp);
    }

    if (definedProp.type == Color) {
      return _handleColorType(definedProp, receivedProp);
    }

    if (definedProp.type == Widget) {
      return _handleWidgetType(definedProp, receivedProp);
    }

    if (definedProp.type == List<Widget>) {
      return _handleListOfWidgets(definedProp, receivedProp);
    }

    return null;
  }

  dynamic _handleReceivedPropNull(dynamic definedProp) {
    if (definedProp.defaultValue != null) {
      return definedProp.defaultValue;
    }

    if (definedProp.isRequired) {
      if (definedProp.type == String) {
        return "";
      } else if (definedProp.type == int) {
        return 0;
      } else if (definedProp.type == double) {
        return 0.0;
      } else if (definedProp.type == bool) {
        return false;
      } else if (definedProp.type == Color) {
        return Colors.transparent;
      } else if (definedProp.type == Widget) {
        return Container();
      } else if (definedProp.type == List<Widget>) {
        return <Widget>[];
      }
    }

    return null;
  }

  dynamic _handleReceivedPropNullEdited(dynamic definedProp) {
    if (definedProp.type == Widget) {
      return _dragTarget();
    }
    return _handleReceivedPropNull(definedProp);
  }

  dynamic _handlePrimitiveTypes(dynamic definedProp, dynamic receivedProp) {
    if (definedProp.type == double && receivedProp is int) {
      return receivedProp.toDouble();
    }
    if (definedProp.type == int && receivedProp is double) {
      return receivedProp.toInt();
    }
    return receivedProp;
  }

  dynamic _handleAllowedValues(dynamic definedProp, dynamic receivedProp) {
    if (definedProp.allowedValues!.containsKey(receivedProp)) {
      return definedProp.allowedValues![receivedProp];
    }
    return null;
  }

  dynamic _handleColorType(dynamic definedProp, dynamic receivedProp) {
    if (receivedProp is String) {
      return Color(int.parse(receivedProp.replaceAll("#", "0xFF")));
    }
    return null;
  }

  dynamic _handleWidgetType(dynamic definedProp, dynamic receivedProp) {
    if (receivedProp == null) {
      return null;
    }

    return core.makeWidget(
      receivedProp["widget_name"],
      receivedProp["props"],
    );
  }

  dynamic _handleListOfWidgets(dynamic definedProp, dynamic receivedProp) {
    var widgets = <Widget>[];

    if (receivedProp == null) {
      return widgets;
    }

    for (var item in receivedProp) {
      final widget = core.makeWidget(
        item["widget_name"],
        item["props"],
      );

      if (widget != null) {
        widgets.add(widget);
      }
    }

    if (edit) widgets.add(_dragTarget());

    return widgets;
  }

  Widget _dragTarget() {
    return DragTarget(
      builder: (context, candidateData, rejectedData) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(
              color: candidateData.isNotEmpty ? Colors.red : Colors.transparent,
              width: 5,
            ),
          ),
        );
      },
      onAccept: (data) {
        print(data);
        print(core.data);
      },
    );
  }
}
