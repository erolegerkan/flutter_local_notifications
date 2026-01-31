import 'package:flutter/material.dart';
import 'package:flutter_local_notification/core/screen_enum.dart';
import 'package:flutter_local_notification/features/home/presentation/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, homeScreenProviderModel, child) => PopScope(
        canPop: homeScreenProviderModel.currentScreen == ScreenEnum.homeWidget,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          homeScreenProviderModel.changeScreen(ScreenEnum.homeWidget);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Local Notifications Demo",style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.blue,
          ),
          floatingActionButton: homeScreenProviderModel.currentScreen == ScreenEnum.homeWidget ? Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.lightBlueAccent),
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              onPressed: () {
                homeScreenProviderModel.changeScreen(
                  ScreenEnum.newNotificationWidget,
                );
              },
              icon: Icon(Icons.add,color: Colors.white,),
            ),
          ) : null,
          body: SafeArea(child: homeScreenProviderModel.getScreen()),
        ),
      ),
    );
  }
}
