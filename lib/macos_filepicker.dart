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

  Future<File> getFile() async {
    final String path = await _channel.invokeMethod("getFile", {
      "title": title,
      "showsResizeIndicator": showReiszeIndicator,
      "showsHiddenFiles": showHiddenFiles,
      "canChooseFiles": canChooseFiles,
      "canChooseDirectories": canChooseDirectories,
      "allowedTypes": allowedTypes,
      "allowsMultipleSelection": false
    });

    return File(path);
  }

  Future<List<File>> getMultipleFiles() async {
    final List<dynamic> paths =
        await _channel.invokeMethod("getMultipleFiles", {
      "title": title,
      "showsResizeIndicator": showReiszeIndicator,
      "showsHiddenFiles": showHiddenFiles,
      "canChooseFiles": canChooseFiles,
      "canChooseDirectories": canChooseDirectories,
      "allowedTypes": allowedTypes,
      "allowsMultipleSelection": true
    });
    List<File> files = paths.map((e) => File(e.toString())).toList();
    paths.forEach((element) {
      print(element.toString());
    });
    return files;
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
