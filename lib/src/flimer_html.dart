import 'package:flimer/flimer.dart';
import 'package:image_picker/image_picker.dart';

getFlimer() => FlimerHtml();

class FlimerHtml implements Flimer {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<XFile?> pickImage({ImageSource source = ImageSource.gallery}) async {
    return await _picker.pickImage(source: source);
  }

  @override
  Future<List<XFile>?> pickImages() async {
    return await _picker.pickMultiImage();
  }
}
