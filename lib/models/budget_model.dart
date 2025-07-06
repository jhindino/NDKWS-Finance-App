// lib/models/budget_model.dart
import 'package:financial_tracker_app/models/category_model.dart';

class Budget {
  final String id;
  final String userId; // To link the budget to a user
  final String name;
  final double totalAmount; // Overall budget amount for a period
  final String currency; // e.g., USD, EUR, JPY
  final DateTime startDate;
  final DateTime endDate;
  final List<Category> categories; // Categories under this budget

  Budget({
    required this.id,
    required this.userId,
    required this.name,
    required this.totalAmount,
    required this.currency,
    required this.startDate,
    required this.endDate,
    required this.categories,
  });

  // Method to convert Budget to a Map (e.g., for Firestore)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'totalAmount': totalAmount,
      'currency': currency,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'categories': categories.map((category) => category.toJson()).toList(),
    };
  }

  // Factory constructor to create a Budget from a Map (e.g., from Firestore)
  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      currency: json['currency'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      categories: (json['categories'] as List<dynamic>)
          .map((categoryJson) => Category.fromJson(categoryJson as Map<String, dynamic>))
          .toList(),
    );
  }
}