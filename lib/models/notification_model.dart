// lib/models/notification_model.dart

class NotificationModel {
  final String id;
  final String userId;
  final String title;
  final String body;
  final DateTime scheduledTime; // For daily reminders
  final bool read;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.scheduledTime,
    this.read = false,
  });

  // Method to convert NotificationModel to a Map (e.g., for local storage or Firestore)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
      'scheduledTime': scheduledTime.toIso8601String(),
      'read': read,
    };
  }

  // Factory constructor to create a NotificationModel from a Map
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      read: json['read'] as bool? ?? false,
    );
  }
}