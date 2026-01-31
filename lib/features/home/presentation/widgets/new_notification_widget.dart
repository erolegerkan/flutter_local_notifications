import 'package:flutter/material.dart';
import 'package:flutter_local_notification/core/colors/custom_colors.dart';
import 'package:flutter_local_notification/core/widgets/custom_button.dart';
import 'package:flutter_local_notification/core/widgets/custom_textfield.dart';
import 'package:jiffy/jiffy.dart';

class NewNotificationWidget extends StatefulWidget {
  const NewNotificationWidget({super.key});

  @override
  State<NewNotificationWidget> createState() => _NewNotificationWidgetState();
}

class _NewNotificationWidgetState extends State<NewNotificationWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isSwitchTurnedOn = false;
  late TimeOfDay pickedTime;
  late DateTime pickedDate;

  @override
  Widget build(BuildContext context) {
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

        CustomButton(buttonText: "Time", buttonIcon: Icons.alarm,onTap: () async {
          pickedTime = (await showTimePicker(context: context, initialTime: TimeOfDay.now()))!;
        },),

        Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Row(
            children: [
              Text(
                "Recursive Notification",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: CustomColors.backgroundColor,
                ),
              ),
              const Spacer(),
              Switch(
                // When switch is turned on
                activeThumbColor: CustomColors.foregroundColor,
                activeTrackColor : CustomColors.foregroundColor.withAlpha(120),
                // When switch is turned off
                inactiveThumbColor: CustomColors.backgroundColor,
                inactiveTrackColor : CustomColors.backgroundColor.withAlpha(200),
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
        if (isSwitchTurnedOn)
          CustomButton(buttonText: "Date", buttonIcon: Icons.calendar_month, onTap: () async {
            pickedDate = (await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: Jiffy.now().add(years: 30).dateTime))!;
          },),

        const Spacer(),
        CustomButton(buttonText: "Save",onTap: (){
          
        },),
      ],
    );
  }
}
