import 'dart:convert';

class Component {
  final String? widgetName;
  final dynamic props;

  Component({this.widgetName, this.props});
  factory Component.fromJson(String str) => Component.fromMap(json.decode(str));

  factory Component.fromMap(Map<String, dynamic> json) => Component(
        widgetName: json["widget_name"],
        props: json["props"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "widget_name": widgetName,
        "props": props?.toMap(),
      };
}
