import 'package:flutter/material.dart';
import 'package:flutter_local_notification/core/colors/custom_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.backgroundColor,
        border: Border.all(color: CustomColors.foregroundColor,width: 4),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: CustomColors.foregroundColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: CustomColors.foregroundColor,
              width: 2,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: CustomColors.foregroundColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
