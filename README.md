# Flimer
Flimer stands for **Fl**utter **Im**age Pick**er** for Mobile, Desktop and Web platforms.

Combining use of packages :
* [image_picker](https://pub.dev/packages/image_picker) : `Android`, `iOS` and `Web`
* [file_selector](https://pub.dev/packages/file_selector) : `MacOS`, `Windows` and `Linux`

Notes:  Because of [pana-issue#889](https://github.com/dart-lang/pana/issues/889) so it only detect for `Web` platform only.

## Install
```yaml
dependencies:
  flimer: latest
```

## Pick a Single Image

```dart
final XFile? file = await flimer.pickImage(source: ImageSource.gallery);
if (file == null) {
  // Operation was canceled by the user.
  return;
}
final String fileName = file.name;
final String filePath = file.path;
```

## Pick Multiple Images

```dart
final List<XFile>? files = await flimer.pickImages();
if (files == null || files.isEmpty) {
  // Operation was canceled by the user.
  return;
}
print("Selected images : ${files.length}")
```

