import 'package:flutter_test/flutter_test.dart';
import 'package:whizapp/core/object_path/object_path.dart';

void main() {
  test('Path of a Simple Object', () {
    final object = {
      "name": {
        "key": "value",
        "2": 2,
      },
      "a": "a"
    };

    expect(ObjectPath.get("name", object), {"key": "value", "2": 2});
    expect(ObjectPath.get("name.key", object), "value");
    expect(ObjectPath.get("name.2", object), 2);
    expect(ObjectPath.get("a", object), "a");
  });

  test('Path of Array item', () {
    final object = {
      "name": {
        "key": "value",
        "2": 2,
      },
      "a": "a",
      "array": [
        {
          "name": "name1",
        },
        {
          "name": "name2",
        },
      ]
    };

    expect(ObjectPath.get("array.0", object), {"name": "name1"});
    expect(ObjectPath.get("array.0.name", object), "name1");
    expect(ObjectPath.get("array.1", object), {"name": "name2"});
    expect(ObjectPath.get("array.1.name", object), "name2");
  });

  test('Path edit', () {
    final object = {
      "name": {
        "key": "value",
        "2": 2,
      },
      "a": "a"
    };

    expect(ObjectPath.set("name.key", "new value", object), {
      "name": {
        "key": "new value",
        "2": 2,
      },
      "a": "a"
    });
  });

  test('Path edit of array item', () {
    final object = {
      "name": {
        "key": "value",
        "2": 2,
      },
      "a": "a",
      "array": [
        {
          "name": "name1",
        },
        {
          "name": "name2",
        },
      ]
    };

    expect(ObjectPath.set("array.0.name", "new name", object), {
      "name": {
        "key": "value",
        "2": 2,
      },
      "a": "a",
      "array": [
        {
          "name": "new name",
        },
        {
          "name": "name2",
        },
      ]
    });
  });

  test('Remove Path', () {
    final object = {
      "name": {
        "key": "value",
        "2": 2,
      },
      "a": "a"
    };

    expect(ObjectPath.remove("name.key", object), {
      "name": {
        "2": 2,
      },
      "a": "a"
    });
  });

  test('Remove Path of Array', () {
    final object = {
      "name": {
        "key": "value",
        "2": 2,
      },
      "a": "a",
      "array": [
        {
          "name": "name1",
        },
        {
          "name": "name2",
        },
      ]
    };

    expect(ObjectPath.remove("array.0.name", object), {
      "name": {
        "key": "value",
        "2": 2,
      },
      "a": "a",
      "array": [
        {},
        {
          "name": "name2",
        },
      ]
    });
  });
}
