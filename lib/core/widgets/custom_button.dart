import 'package:flutter/material.dart';
import 'package:flutter_local_notification/core/colors/custom_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonIcon,
  });

  final String buttonText;
  final IconData buttonIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: CustomColors.backgroundColor,
          border: Border.all(color: CustomColors.foregroundColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
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
            Icon(buttonIcon, color: CustomColors.foregroundColor,size: 30,),
          ],
        ),
      ),
    );
  }
}
