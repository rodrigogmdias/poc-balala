import 'package:flutter/material.dart';

import '../core.dart';
import '../props_parser/props_parser.dart';

class WidgetProps {
  final Type type;
  final dynamic defaultValue;
  final Map<String, dynamic>? allowedValues;
  final bool isRequired;

  const WidgetProps({
    required this.type,
    this.defaultValue,
    this.allowedValues,
    this.isRequired = false,
  });
}

abstract class Converter {
  Core? core;
  bool edit = false;

  String name();
  Map<String, WidgetProps> definedProps();
  Widget makeWidget(dynamic props);

  dynamic coreWidget(String key, dynamic props) {
    final definedProp = definedProps()[key];
    final receivedProp = props != null ? props[key] : null;

    if (core == null) {
      throw Exception("Core is null");
    }

    return PropsParser(
      core: core!,
      edit: edit,
    ).parser(definedProp, receivedProp);
  }
}
