import 'dart:convert';

import 'package:flutter/material.dart';

import 'abstracts/converter.dart';
import 'converters/column.dart';
import 'converters/container.dart';
import 'converters/row.dart';
import 'converters/sized_box.dart';
import 'converters/text.dart';

class Core {
  dynamic data = {};

  final _converters = <Converter>[
    ContainerConverter(),
    TextConverter(),
    RowConverter(),
    ColumnConverter(),
    SizedBoxConverter(),
  ];

  registerConverter(Converter converter) {
    converter.core = this;
    _converters.add(converter);
  }

  Widget? makeWidgetFromJson(String json, {bool edit = false}) {
    data = jsonDecode(json);
    return makeWidget(data['widget_name'], data['props'], edit: edit);
  }

  Widget? makeWidget(String objectPath, dynamic props, {bool edit = false}) {
    print(objectPath);
    final paths = objectPath.split(".");
    final name = paths.last;

    for (var converter in _converters) {
      if (converter.name() == name) {
        converter.core = this;
        converter.edit = edit;
        return converter.makeWidget(props);
      }
    }

    return null;
  }
}
