import 'package:flutter/material.dart';
import 'package:notifications_demo/home_page.dart';
import 'package:notifications_demo/notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //init notifications
  NotificationService().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}
