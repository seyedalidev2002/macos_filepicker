
import 'dart:async';

import 'package:flutter/services.dart';

class MacosFilepicker {
  static const MethodChannel _channel =
      const MethodChannel('macos_filepicker');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
