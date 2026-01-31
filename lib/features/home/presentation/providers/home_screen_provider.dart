import 'package:flutter/widgets.dart';
import 'package:flutter_local_notification/core/enums/screen_enum.dart';
import 'package:flutter_local_notification/features/home/presentation/widgets/home_screen_widget.dart';
import 'package:flutter_local_notification/features/home/presentation/widgets/new_notification_widget.dart';

class HomeScreenProvider extends ChangeNotifier {
  ScreenEnum currentScreen = ScreenEnum.homeWidget;

  void changeScreen(ScreenEnum newScreen){
    currentScreen = newScreen;
    notifyListeners();
  } 

  Widget getScreen(){
    switch (currentScreen) {
      case ScreenEnum.homeWidget:
        return HomeScreenWidget();
      case ScreenEnum.newNotificationWidget:
        return NewNotificationWidget();
      }
  }
}