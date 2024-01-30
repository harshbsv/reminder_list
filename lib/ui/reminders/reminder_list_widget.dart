import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder_list/models/reminder.dart';
import 'package:reminder_list/providers/reminder_list_provider.dart';

///Builds the ListView on Home screen when user creates or saves new Reminders.
class ReminderListWidget extends StatelessWidget {
  const ReminderListWidget({
    super.key,
    required this.reminders,
    required this.ref,
  });

  final List<Reminder> reminders;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 10,
      ),
      child: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          // Display each Reminder using a seperate ListTile.
          final reminder = reminders[index];
          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
            ),
            child: ListTile(
              title: Text(
                reminder.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                reminder.timestamp,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              shape: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.purple,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              iconColor: Colors.red,
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // Delete the reminder using the provider, and refresh the list.
                  ref.read(reminderListProvider.notifier).delete(reminder.id);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
