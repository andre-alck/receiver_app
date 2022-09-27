import 'package:flutter/material.dart';
import 'package:flutter_amqp/screens/details/details_screen.dart';

void showNotification(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification'),
          content: Column(
            children: [
              const Text('Notification content here'),
              MaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      message: message,
                    ),
                  ),
                ),
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