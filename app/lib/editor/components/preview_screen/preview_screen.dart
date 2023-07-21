import 'package:flutter/material.dart';

import '../../../core/core.dart';

class PreviewScreen extends StatelessWidget {
  PreviewScreen({
    super.key,
  });

  final core = Core();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Container(
          width: 430,
          height: 800,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: 1,
              ),
            ),
            child: core.makeWidgetFromJson(
              """
{
  "widget_name": "Column",
  "props": {
    "children": [
      {
        "widget_name": "Text",
        "props": {
          "data": "Hello World"
        }
      },
      {
        "widget_name": "Container",
        "props": {
          "child": {
            "widget_name": "Text",
            "props": {
              "data": "Hello World"
            }
          }
        }
      },
      {
        "widget_name": "Container"
      }
    ]
  }
}

            """,
              edit: true,
            ),
          ),
        ),
      ),
    );
  }
}
