import 'package:flutter/material.dart';
import 'package:flutter_local_notification/core/colors/custom_colors.dart';
import 'package:flutter_local_notification/core/enums/screen_enum.dart';
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
          backgroundColor: CustomColors.appBackgroundColor,
          appBar: AppBar(
            title: Text("Local Notifications Demo",style: TextStyle(color: CustomColors.foregroundColor,fontSize: 25,fontWeight: FontWeight.bold),),
            backgroundColor: CustomColors.backgroundColor,
          ),
          floatingActionButton: homeScreenProviderModel.currentScreen == ScreenEnum.homeWidget ? Container(
            decoration: BoxDecoration(
              color: CustomColors.backgroundColor,
              border: Border.all(color: CustomColors.foregroundColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              onPressed: () {
                homeScreenProviderModel.changeScreen(
                  ScreenEnum.newNotificationWidget,
                );
              },
              icon: Icon(Icons.add,color: CustomColors.foregroundColor,),
            ),
          ) : null,
          body: SafeArea(child: homeScreenProviderModel.getScreen()),
        ),
      ),
    );
  }
}
