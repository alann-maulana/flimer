import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flimer/flimer.dart';
import 'package:image_picker/image_picker.dart';

getFlimer() => FlimerIO();

class FlimerIO implements Flimer {
  final _typeGroup = XTypeGroup(
    label: 'images',
    extensions: [
      'jpg',
      'jpeg',
      'png',
      'webp',
      'bmp',
    ],
  );

  @override
  Future<XFile?> pickImage({ImageSource source = ImageSource.gallery}) async {
    // Mobile platforms
    if (Platform.isAndroid || Platform.isIOS) {
      final ImagePicker picker = ImagePicker();

      return await picker.pickImage(source: source);
    }

    // Desktop platforms
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      return await openFile(acceptedTypeGroups: [_typeGroup]);
    }

    throw UnimplementedError('Unknown platform ${Platform.operatingSystem}');
  }

  @override
  Future<List<XFile>?> pickImages() async {
    // Mobile platforms
    if (Platform.isAndroid || Platform.isIOS) {
      final ImagePicker picker = ImagePicker();

      return await picker.pickMultiImage();
    }

    // Desktop platforms
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      return await openFiles(acceptedTypeGroups: [_typeGroup]);
    }

    throw UnimplementedError('Unknown platform ${Platform.operatingSystem}');
  }
}
