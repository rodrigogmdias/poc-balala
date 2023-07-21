import 'package:flutter/material.dart';

class Utils {
  static Widget makeDropTarget(Widget child, Function(dynamic) onAccept) {
    return DragTarget(
      builder: (context, candidateData, rejectedData) {
        return child;
      },
      onAccept: (data) {
        onAccept(data);
      },
    );
  }
}
