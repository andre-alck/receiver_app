import 'package:flutter/material.dart';
import 'package:flutter_amqp/screens/details/details_screen.dart';
import 'package:flutter_amqp/services/user_storage.dart';

void showNotification(BuildContext context, String message) {
  String user = UniqueKey().toString();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Notification'),
        content: Column(
          children: [
            const Text('Notification content here'),
            MaterialButton(
              onPressed: () async {
                if (await _isTheRightUser(user)) {
                  writeUserFile("");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        message: message,
                      ),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
              color: Colors.red,
              child: const Text('Go to Notification Screen'),
            ),
          ],
        ),
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 100,
        ),
      );
    },
  );
}

Future<bool> _isTheRightUser(String user) async {
  String userFileContent;

  if (!await fileExists()) {
    writeUserFile(user);
  }

  userFileContent = await readUserFile();

  return userFileContent == user;
}
