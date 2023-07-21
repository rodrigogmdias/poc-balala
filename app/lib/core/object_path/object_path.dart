class ObjectPath {
  static get(String path, dynamic object) {
    final keys = path.split(".");
    var currentObject = object;

    for (var i = 0; i < keys.length; i++) {
      final key = keys[i];

      if (currentObject is List) {
        currentObject = currentObject[int.parse(key)];
        continue;
      } else {
        currentObject = currentObject[key];
      }
    }

    return currentObject;
  }

  static dynamic set(String path, dynamic value, dynamic object) {
    final keys = path.split(".");
    var currentObject = object;

    for (var i = 0; i < keys.length - 1; i++) {
      final key = keys[i];

      if (currentObject is List) {
        currentObject = currentObject[int.parse(key)];
        continue;
      } else {
        currentObject = currentObject[key];
      }
    }

    final lastKey = keys.last;
    currentObject[lastKey] = value;

    return object;
  }

  static dynamic remove(String path, dynamic object) {
    final keys = path.split(".");
    var currentObject = object;

    for (var i = 0; i < keys.length - 1; i++) {
      final key = keys[i];

      if (currentObject is List) {
        currentObject = currentObject[int.parse(key)];
        continue;
      } else {
        currentObject = currentObject[key];
      }
    }

    final lastKey = keys.last;
    currentObject.remove(lastKey);

    return object;
  }
}
