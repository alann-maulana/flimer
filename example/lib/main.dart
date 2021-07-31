import 'package:flimer/flimer.dart';
import 'package:flutter/material.dart';

import 'image_display.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.blue,
      onPrimary: Colors.white,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flimer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: style,
              child: Text('Open an image'),
              onPressed: _openImageFile,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: style,
              child: Text('Open multiple images'),
              onPressed: _openImageFiles,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              style: style,
              child: Text('Take a picture'),
              onPressed: _takePicture,
            ),
          ],
        ),
      ),
    );
  }

  void _openImageFile() async {
    final file = await flimer.pickImage(source: ImageSource.gallery);
    if (file == null) {
      // Operation was canceled by the user.
      return;
    }
    final String fileName = file.name;
    final String filePath = file.path;

    await showDialog(
      context: context,
      builder: (context) => ImageDisplay(fileName, filePath),
    );
  }

  void _openImageFiles() async {
    final files = await flimer.pickImages();
    if (files == null || files.isEmpty) {
      // Operation was canceled by the user.
      return;
    }

    await showDialog(
      context: context,
      builder: (context) => MultipleImagesDisplay(files),
    );
  }

  void _takePicture() async {
    final file = await flimer.pickImage(source: ImageSource.camera);
    if (file == null) {
      // Operation was canceled by the user.
      return;
    }
    final String fileName = file.name;
    final String filePath = file.path;

    await showDialog(
      context: context,
      builder: (context) => ImageDisplay(fileName, filePath),
    );
  }
}
