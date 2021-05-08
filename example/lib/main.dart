import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:macos_filepicker/macos_filepicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     platformVersion = await MacosFilepicker.platformVersion;
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                  color: Colors.amber,
                  child: Text("asdhjkaljl"),
                  onPressed: () async {
                    MacosFilepicker picker = MacosFilepicker(
                        title: "hello",
                        canChooseDirectories: true,
                        canChooseFiles: true,
                        showHiddenFiles: true,
                        showReiszeIndicator: false);
                    (await picker.getMultipleFiles());
                    setState(() {
                      _platformVersion = _platformVersion;
                    });
                  }),
              Text('Running on: ${_platformVersion ?? "dfskjfdslkdf"}\n'),
            ],
          ),
        ),
      ),
    );
  }
}
