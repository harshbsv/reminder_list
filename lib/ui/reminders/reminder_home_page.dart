// Create the main page widget
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:reminder_list/providers/reminder_list_provider.dart';
import 'package:reminder_list/ui/add_reminder_page.dart';
import 'package:reminder_list/ui/reminders/no_reminder_widget.dart';
import 'package:reminder_list/ui/reminders/reminder_list_widget.dart';

/// Home page where a ListView of all the Reminders created by the user are displayed.
class ReminderMainPage extends ConsumerWidget {
  const ReminderMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the Reminder list from the provider
    final reminders = ref.watch(reminderListProvider);
    // Create a ListView to display the Reminder list
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text(
          'Reminders',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: reminders.isEmpty
          ? const NoReminderText()
          : ReminderListWidget(
              reminders: reminders,
              ref: ref,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Add Reminder page to add new reminders.
          Navigator.push(
            context,
            PageTransition(
              child: AddReminderPage(),
              type: PageTransitionType.fade,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
