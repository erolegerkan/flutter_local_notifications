import 'package:flutter/material.dart';
import 'package:flutter_local_notification/core/colors/custom_colors.dart';
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
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // CURSOR AND SELECTION THEME
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: CustomColors.foregroundColor,
            selectionColor: CustomColors.backgroundColor,
            selectionHandleColor: CustomColors.foregroundColor,
          ),

          // --- TIME PICKER THEME ---
          timePickerTheme: TimePickerThemeData(
            backgroundColor: CustomColors.appBackgroundColor,
            hourMinuteColor: CustomColors.backgroundColor,
            hourMinuteTextColor: CustomColors.appBackgroundColor,
            dialBackgroundColor: CustomColors.backgroundColor,
            dialHandColor: const Color.fromRGBO(
              12,
              237,
              222,
              1,
            ), // Saat akrebi/yelkovanı
            dialTextColor: CustomColors.appBackgroundColor,
            dayPeriodColor: CustomColors.foregroundColor,
            dayPeriodTextColor: CustomColors.backgroundColor,
            dialTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: CustomColors.backgroundColor),
            ),
            cancelButtonStyle: TextButton.styleFrom(
              foregroundColor: CustomColors.backgroundColor,
              textStyle: TextStyle(fontSize: 20),
            ),
            confirmButtonStyle: TextButton.styleFrom(
              foregroundColor: CustomColors.backgroundColor,
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),

          // --- DATE PICKER THEME ---
          datePickerTheme: DatePickerThemeData(
            backgroundColor: CustomColors.appBackgroundColor,
            headerBackgroundColor: CustomColors.backgroundColor,
            headerForegroundColor: CustomColors.foregroundColor,
            surfaceTintColor: Colors.transparent,
            dayStyle: const TextStyle(fontWeight: FontWeight.bold),

            dayForegroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return CustomColors.foregroundColor;
              }

              return const Color(0xFF1A1A1A);
            }),
            dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return CustomColors.backgroundColor;
              }
              return null;
            }),

            yearForegroundColor: WidgetStateProperty.all(
              const Color(0xFF1A1A1A),
            ),
            yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return CustomColors.backgroundColor;
              }
              return null;
            }),

            cancelButtonStyle: TextButton.styleFrom(
              foregroundColor: CustomColors.backgroundColor,
            ),
            confirmButtonStyle: TextButton.styleFrom(
              foregroundColor: CustomColors.backgroundColor,
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
