import 'package:flimer/flimer.dart';

getFlimer() => FlimerStub();

class FlimerStub implements Flimer {
  @override
  Future<XFile?> pickImage({ImageSource source = ImageSource.gallery}) {
    throw UnimplementedError('Unknown platform');
  }

  @override
  Future<List<XFile>?> pickImages() {
    throw UnimplementedError('Unknown platform');
  }
}
