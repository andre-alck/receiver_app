import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/user.txt');
}

Future<File> writeUserFile(String user) async {
  final file = await _localFile;
  return file.writeAsString(user);
}

Future<String> readUserFile() async {
  try {
    final file = await _localFile;
    return file.readAsString();
  } catch (e) {
    return 'Error.';
  }
}

Future<bool> fileExists() async {
  File file = await _localFile;
  return file.exists();
}
