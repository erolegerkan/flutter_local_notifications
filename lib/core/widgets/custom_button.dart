import 'package:flutter/material.dart';
import 'package:flutter_local_notification/core/colors/custom_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText, this.buttonIcon, required this.onTap});

  final String buttonText;
  final IconData? buttonIcon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: CustomColors.backgroundColor,
          border: Border.all(color: CustomColors.foregroundColor,width: 4),
          borderRadius: BorderRadius.circular(16),
        ),
        child: buttonIcon != null
            ? Row(
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: CustomColors.foregroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    buttonIcon,
                    color: CustomColors.foregroundColor,
                    size: 30,
                  ),
                ],
              )
            : Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: CustomColors.foregroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
      ),
    );
  }
}
