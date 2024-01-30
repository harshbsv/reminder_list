import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder_list/models/reminder.dart';
import 'package:reminder_list/providers/reminder_list_provider.dart';

/// Widget to Add new Reminders to the list of Reminders on Home Page
/// of the app.
class AddReminderPage extends ConsumerWidget {
  AddReminderPage({Key? key}) : super(key: key);

  // Define the form fields for title and description
  final titleController = TextEditingController();
  final timestampController = TextEditingController();
  //Form Key for validation of the fields
  final _addReminderFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Reminder'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _addReminderFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title field can\'t be left empty!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: timestampController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Time Stamp',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Time field can\'t be left empty!';
                  }
                  return null;
                },
                onTap: () {
                  _selectTime(context);
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_addReminderFormKey.currentState!.validate()) {
                    // Get the reminder list provider
                    final provider = ref.read(reminderListProvider.notifier);
                    // Create a new Reminder object to add to the provider
                    final reminder = Reminder(
                      id: UniqueKey().toString(),
                      title: titleController.text,
                      timestamp: timestampController.text,
                    );
                    // Add the reminder to the ListView on home screen using the provider
                    provider.add(reminder);
                    // Navigate back to the main page
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 40),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    timestampController.text = '${picked!.hour}:${picked.minute}';
  }
}
