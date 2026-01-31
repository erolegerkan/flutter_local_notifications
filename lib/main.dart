import 'package:flutter/material.dart';
import 'package:flutter_local_notification/features/home/presentation/providers/home_screen_provider.dart';
import 'package:flutter_local_notification/features/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> HomeScreenProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
      ),
    );
  }
}
