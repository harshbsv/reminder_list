import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reminder_list/ui/reminders/reminder_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ProviderScope set here so the whole widget tree can have access
    // to any of the providers created.
    return ProviderScope(
      child: MaterialApp(
        title: 'Reminders',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ReminderMainPage(),
      ),
    );
  }
}
