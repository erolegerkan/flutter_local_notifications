import 'package:flutter/material.dart';
import 'package:flutter_local_notification/core/colors/custom_colors.dart';
import 'package:flutter_local_notification/core/widgets/custom_button.dart';
import 'package:flutter_local_notification/core/widgets/custom_textfield.dart';

class NewNotificationWidget extends StatefulWidget {
  const NewNotificationWidget({super.key});

  @override
  State<NewNotificationWidget> createState() => _NewNotificationWidgetState();
}

class _NewNotificationWidgetState extends State<NewNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    bool isSwitchTurnedOn = false;

    return Column(
      children: [
        CustomTextfield(
          controller: titleController,
          hintText: "Notification Title",
        ),
        CustomTextfield(
          controller: descriptionController,
          hintText: "Notification Description",
        ),

        CustomButton(buttonText: "Time", buttonIcon: Icons.alarm),

        Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Row(
            children: [
              Text("Recursive Notification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: CustomColors.backgroundColor),),
              const Spacer(),
              Switch(
                value: isSwitchTurnedOn,
                onChanged: (value) {
                  setState(() {
                    isSwitchTurnedOn = value;
                  });
                },
              ),
            ],
          ),
        ),
        CustomButton(buttonText: "Date", buttonIcon: Icons.calendar_month),
      ],
    );
  }
}
