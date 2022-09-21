import 'package:flutter/material.dart';
import 'package:flutter_amqp/receiver_amqp.dart';

class Body extends StatelessWidget {
  const Body({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data.toString();
            return Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }

        return const Center(
            child: CircularProgressIndicator(),
          );
      }),
      future: receive(),
    );
  }
}
