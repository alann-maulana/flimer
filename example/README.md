# Flimer Example

Demonstrates how to use the flimer plugin.

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
