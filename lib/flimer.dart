import 'dart:async';

import 'package:image_picker/image_picker.dart';

import 'src/flimer_stub.dart'
    if (dart.library.io) 'src/flimer_io.dart'
    if (dart.library.html) 'src/flimer_html.dart';

export 'package:file_selector_platform_interface/file_selector_platform_interface.dart'
    show XFile;
export 'package:image_picker_platform_interface/image_picker_platform_interface.dart'
    show ImageSource;
export 'src/flimer_stub.dart'
    if (dart.library.io) 'src/flimer_io.dart'
    if (dart.library.html) 'src/flimer_html.dart';

/// Global singleton [Flimer] instance
final Flimer flimer = Flimer();

/// Flimer stands for Flutter Image Picker.
abstract class Flimer {
  /// Construct flimer using global platform getter.
  factory Flimer() => getFlimer();

  /// Pick a single image.
  ///
  /// Define the [ImageSource] On Android and iOS platforms. While on Desktop
  /// and Web this will open a dialog image picker
  Future<XFile?> pickImage({ImageSource source = ImageSource.gallery});

  /// Pick multiple images at once.
  ///
  /// Open the image gallery on Android and iOS platforms. While on Desktop
  /// and Web this will open a dialog images picker
  Future<List<XFile>?> pickImages();
}
