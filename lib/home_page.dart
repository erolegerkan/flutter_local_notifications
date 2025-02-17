import 'package:flutter/material.dart';
import 'package:notifications_demo/notification_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //NotificationService().initNotification;
            counter++;
            print("Notification number $counter");
            NotificationService().showNotification(
              id: 0,
              title: "Deneme",
              body: "Notification number $counter"
            );
          },
          child: Text('Send notification'),
        ),
      ),
    );
  }
}
