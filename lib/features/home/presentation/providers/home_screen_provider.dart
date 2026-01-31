import 'package:flutter/widgets.dart';
import 'package:flutter_local_notification/features/home/presentation/widgets/home_screen_widget.dart';

class HomeScreenProvider extends ChangeNotifier {
  Widget currentScreen = HomeScreenWidget();

  void changeScreen(Widget newScreen){
    currentScreen = newScreen;
    notifyListeners();
  } 
}