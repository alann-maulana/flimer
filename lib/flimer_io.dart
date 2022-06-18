import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flimer/flimer.dart';
import 'package:image_picker/image_picker.dart' as ip;

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
  Future<XFile?> pickImage({
    ImageSource source = ImageSource.gallery,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    // Mobile platforms
    if (Platform.isAndroid || Platform.isIOS) {
      final ip.ImagePicker picker = ip.ImagePicker();

      return await picker.pickImage(
        source: source,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
        preferredCameraDevice: preferredCameraDevice,
      );
    }

    // Desktop platforms
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      return await openFile(acceptedTypeGroups: [_typeGroup]);
    }

    throw UnimplementedError('Unknown platform ${Platform.operatingSystem}');
  }

  @override
  Future<List<XFile>?> pickImages({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    // Mobile platforms
    if (Platform.isAndroid || Platform.isIOS) {
      final ip.ImagePicker picker = ip.ImagePicker();

      return await picker.pickMultiImage(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );
    }

    // Desktop platforms
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      return await openFiles(acceptedTypeGroups: [_typeGroup]);
    }

    throw UnimplementedError('Unknown platform ${Platform.operatingSystem}');
  }
}
