import 'package:flutter/material.dart';
import 'package:flutter_local_notification/features/home/presentation/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Local Notifications Demo")),
      body: Consumer<HomeScreenProvider>(
        builder:
            (context,  homeScreenProviderModel,child) => SafeArea(child: homeScreenProviderModel.currentScreen),
      ),
    );
  }
}
