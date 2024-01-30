import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

//Reminder object model.

@freezed
class Reminder with _$Reminder {
  const factory Reminder({
    required String id,
    required String title,
    required String timestamp,
  }) = _Reminder;

  factory Reminder.fromJson(Map<String, Object?> json) =>
      _$ReminderFromJson(json);
}
