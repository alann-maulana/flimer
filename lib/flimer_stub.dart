import 'package:flimer/flimer.dart';

getFlimer() => FlimerStub();

class FlimerStub implements Flimer {
  @override
  Future<XFile?> pickImage({
    ImageSource source = ImageSource.gallery,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) {
    throw UnimplementedError('Unknown platform');
  }

  @override
  Future<List<XFile>?> pickImages({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) {
    throw UnimplementedError('Unknown platform');
  }
}
