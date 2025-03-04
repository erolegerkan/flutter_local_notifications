import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  final bool _isInitiliazed = false;

  bool get isInitialized => _isInitiliazed;

  Future<void> takeUserPermit() async {
    // Kullanıcıdan bildirim izni iste
    await requestNotificationPermission();

    // Eğer Android 12+ ise, tam zamanlı (exact) alarm izni de iste
    if (Platform.isAndroid && await Permission.scheduleExactAlarm.isDenied) {
      await Permission.scheduleExactAlarm.request();
    }

    // Burada bildirimleri başlat
    await initNotification();
  }

  Future<void> requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  // INITALIZE
  Future<void> initNotification() async {
    if (_isInitiliazed) return; //prevent re-initialization

    // initialize timezone
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    //prepare android init settings
    const initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    //prepare ios init settings
    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    //init settings
    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    // finally, initialized plugin
    await notificationsPlugin.initialize(initSettings);
  }

  // NOTIFICATIONS DETAIL SETUP
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notifications',
        channelDescription: 'Daily Notification Channel',
        icon: "@mipmap/ic_launcher",
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  // SHOW NOTIFICATION
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationsPlugin.show(id, title, body, notificationDetails());
  }

  // ON NOTIFICATION TAP

  // SCHEDULED NOTIFICATION
  // -> hour 0-23
  // -> minute 0-59

  Future<void> scheduledNotification({
    int id = 1,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    // Get the current date/time in device's local timezone
    final now = tz.TZDateTime.now(tz.local);

    // Create a date/time
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    await notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails(),

      //iOS specific : use exact time specified (vs related time)
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,

      // android specific : allow notifications while device is in low - power mode
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,

      // Make notification repeat daily at the same time
      matchDateTimeComponents: DateTimeComponents.time,
    );
    //}
    // Scheduled the notification
  }

  //Cancel all the notifications that are currently active
  Future<void> cancelAllNotifications() async {
    await notificationsPlugin.cancelAll();
  }

  // Cancel specific notification with notification id
  Future<void> cancelSpecificNotification(int id) async {
    await notificationsPlugin.cancel(id);
  }

}
