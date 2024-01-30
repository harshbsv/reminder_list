import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder_list/models/reminder.dart';
import 'package:reminder_list/notifiers/reminder_notifier.dart';

/// A universally accessible Provider created to handle Adding, Deleting 
/// and Viewing the list of all reminders.
final reminderListProvider =
    StateNotifierProvider<ReminderListNotifier, List<Reminder>>((ref) {
  return ReminderListNotifier([]);
});
