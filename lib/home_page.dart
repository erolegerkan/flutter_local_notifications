import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notifications_demo/notification_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    TextEditingController hourController = TextEditingController();
    TextEditingController minuteController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.blue,
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.purple,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: hourController,
                      decoration: InputDecoration(
                        hintText: 'Hours',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      controller: minuteController,
                      decoration: InputDecoration(
                        hintText: 'Minutes',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //NotificationService().initNotification;
                int hour = int.parse(hourController.text);
                int minute = int.parse(minuteController.text);
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                NotificationService().cancelAllNotifications();
                log("All notifications cancelled successfully");
              },
              child: Text('Cancel all notifications'),
            ),
          ],
        ),
      ),
    );
  }
}
