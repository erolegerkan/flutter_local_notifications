import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notifications_demo/notification_service.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

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
                counter++;
                log("Notification number $counter");
                NotificationService().showNotification(
                    id: 0,
                    title: "Deneme",
                    body: "Notification number $counter");
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Notification number $counter"),
                  ),
                );
              },
              child: Text('Send notification'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                tz.initializeTimeZones();
                final String currentTimeZone =
                    await FlutterTimezone.getLocalTimezone();
                tz.setLocalLocation(tz.getLocation(currentTimeZone));
                final now = tz.TZDateTime.now(tz.local);
                int hour = now.hour;
                int minute = now.minute + 1;
                NotificationService().scheduledNotification(
                  title: 'Scheduled notification',
                  body: 'Scheduled notification test : $hour : $minute',
                  hour: hour,
                  minute: minute,
                );
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Daily Scheduled Notification Time : $hour : $minute"),
                  ),
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
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("All notifications cancelled successfully"),
                  ),
                );
              },
              child: Text('Cancel all the scheduled notifications'),
            ),
          ],
        ),
      ),
    );
  }
}
