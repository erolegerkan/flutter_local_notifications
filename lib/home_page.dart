import 'dart:developer';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //NotificationService().initNotification;
                counter++;
                log("Notification number $counter");
                NotificationService().showNotification(
                    id: 0,
                    title: "Deneme",
                    body: "Notification number $counter");
              },
              child: Text('Send notification'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //NotificationService().initNotification;
                int hour = 16;
                int minute = 33;
                NotificationService().scheduledNotification(
                  title: 'Scheduled notification',
                  body: 'Scheduled notification test',
                  hour: hour,
                  minute: minute,
                );

                log("Daily Scheduled Notification Time : $hour : $minute");
              },
              child: Text('Send scheduled notification'),
            ),
          ],
        ),
      ),
    );
  }
}
