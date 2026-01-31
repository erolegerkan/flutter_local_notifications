import 'package:flutter/material.dart';
import 'package:flutter_local_notification/core/widgets/custom_textfield.dart';

class NewNotificationWidget extends StatelessWidget {
  const NewNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Column(
      children: [
        CustomTextfield(controller: titleController, hintText: "Notification Title"),
        CustomTextfield(controller: descriptionController, hintText: "Notification Description"),
        
      ],
    );
  }
}