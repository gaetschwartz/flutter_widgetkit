import 'dart:async';

import 'package:flutter/services.dart';

class WidgetKit {
  static const MethodChannel _channel = MethodChannel('flutter_widgetkit');

  static Future<void> reloadAllTimelines() async {
    await _channel.invokeMethod('reloadAllTimelines');
  }

  static Future<void> reloadTimelines(String ofKind) async {
    await _channel
        .invokeMethod('reloadTimelines', <String, dynamic>{'ofKind': ofKind});
  }

  static Future<dynamic> getItem(String key, String appGroup) async {
    return await _channel.invokeMethod(
        'getItem', <String, dynamic>{'key': key, 'appGroup': appGroup});
  }

  static Future<dynamic> setItem(
      String key, dynamic value, String appGroup) async {
    return await _channel.invokeMethod('setItem',
        <String, dynamic>{'key': key, 'value': value, 'appGroup': appGroup});
  }

  static Future<bool?> removeItem(String key, String appGroup) async {
    return await _channel.invokeMethod<bool>(
        'removeItem', <String, dynamic>{'key': key, 'appGroup': appGroup});
  }
}
