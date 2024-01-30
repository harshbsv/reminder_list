// ReminderListNotifier class that extends StateNotifier to manage the Reminder list
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder_list/models/reminder.dart';

/// Notifier for the Reminders
class ReminderListNotifier extends StateNotifier<List<Reminder>> {
  ReminderListNotifier(super.state);
  /// Function to add a new Reminder to the list.
  /// Takes a Reminder object as the value to add new Reminders.
  void add(Reminder reminder) {
    state = [...state, reminder];
  }
  /// Function to delete a Reminder from the list.
  /// Takes the ID each Reminder object is assgined at the time of its creation.
  void delete(String id) {
    state = state.where((reminder) => reminder.id != id).toList();
  }
}