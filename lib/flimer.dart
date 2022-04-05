import 'dart:async';

import 'package:cross_file/cross_file.dart';
import 'package:image_picker/image_picker.dart' show ImageSource, CameraDevice;

import 'src/flimer_stub.dart'
    if (dart.library.io) 'src/flimer_io.dart'
    if (dart.library.html) 'src/flimer_html.dart';

export 'package:cross_file/cross_file.dart' show XFile;
export 'package:image_picker/image_picker.dart' show ImageSource, CameraDevice;

export 'src/flimer_stub.dart'
    if (dart.library.io) 'src/flimer_io.dart'
    if (dart.library.html) 'src/flimer_html.dart';

/// Global singleton [Flimer] instance
final Flimer flimer = Flimer();

/// Flimer stands for Flutter Image Picker.
abstract class Flimer {
  static void registerWith() {}

  /// Construct flimer using global platform getter.
  factory Flimer() => getFlimer();

  /// Pick a single image.
  ///
  /// Define the [ImageSource] On Android and iOS platforms. While on Desktop
  /// and Web this will open a dialog image picker
  Future<XFile?> pickImage({
    ImageSource source = ImageSource.gallery,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  });

  /// Pick multiple images at once.
  ///
  /// Open the image gallery on Android and iOS platforms. While on Desktop
  /// and Web this will open a dialog images picker
  Future<List<XFile>?> pickImages({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  });
}
