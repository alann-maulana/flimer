import 'package:flimer/flimer.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:image_picker/image_picker.dart' as ip;

getFlimer() => FlimerHtml();

class FlimerHtml implements Flimer {
  static void registerWith(Registrar registrar) {}

  final ip.ImagePicker _picker = ip.ImagePicker();

  @override
  Future<XFile?> pickImage({ImageSource source = ImageSource.gallery}) async {
    return await _picker.pickImage(source: ip.ImageSource.values[source.index]);
  }

  @override
  Future<List<XFile>?> pickImages() async {
    return await _picker.pickMultiImage();
  }
}
