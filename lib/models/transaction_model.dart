// lib/models/transaction_model.dart
import 'package:financial_tracker_app/models/category_model.dart';

class Transaction {
  final String id;
  final String userId; // To link the transaction to a user
  final String budgetId; // To link to a specific budget (optional, could also be just by date)
  final String categoryId; // To link to a specific category
  final CategoryType type; // Income or Expense - should match category type
  final double amount;
  final String currency; // Should match budget currency
  final DateTime date;
  final String? description; // Optional notes
  // final String? receiptImageUrl; // Optional

  Transaction({
    required this.id,
    required this.userId,
    required this.budgetId,
    required this.categoryId,
    required this.type,
    required this.amount,
    required this.currency,
    required this.date,
    this.description,
    // this.receiptImageUrl,
  });

  // Method to convert Transaction to a Map (e.g., for Firestore)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'budgetId': budgetId,
      'categoryId': categoryId,
      'type': type.toString(),
      'amount': amount,
      'currency': currency,
      'date': date.toIso8601String(),
      'description': description,
      // 'receiptImageUrl': receiptImageUrl,
    };
  }

  // Factory constructor to create a Transaction from a Map (e.g., from Firestore)
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as String,
      userId: json['userId'] as String,
      budgetId: json['budgetId'] as String,
      categoryId: json['categoryId'] as String,
      type: CategoryType.values.firstWhere(
            (e) => e.toString() == json['type'] as String,
            orElse: () => CategoryType.expense, // Default
      ),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String?,
      // receiptImageUrl: json['receiptImageUrl'] as String?,
    );
  }
}