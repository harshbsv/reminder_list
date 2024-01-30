import 'package:flutter/material.dart';

/// Displays a preset message in case the user has no Reminders created/saved.
class NoReminderText extends StatelessWidget {
  const NoReminderText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No new Reminders. Add from the button below!',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}