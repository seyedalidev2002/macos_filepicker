import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class MacosFilepicker {
  static const MethodChannel _channel = const MethodChannel('macos_filepicker');
  final String title;
  final bool showReiszeIndicator,
      showHiddenFiles,
      canChooseFiles,
      canChooseDirectories;
  final List<String> allowedTypes;

  MacosFilepicker(
      {this.title,
      this.showReiszeIndicator,
      this.showHiddenFiles,
      this.canChooseFiles,
      this.canChooseDirectories,
      this.allowedTypes});

  Future<String> getFile() async {
    final String path = await _channel.invokeMethod("openFileDialog", [
      title,
      showReiszeIndicator,
      showHiddenFiles,
      canChooseFiles,
      canChooseDirectories,
      allowedTypes,
    ]);
    return path;
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
