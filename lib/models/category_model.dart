// lib/models/category_model.dart

enum CategoryType {
  income,
  expense,
}

class Category {
  final String id;
  final String name;
  final CategoryType type; // Income or Expense
  final double allocatedAmount; // Amount allocated to this category in a budget
  // Optional: Add an icon or color for UI representation
  // final String? iconName;
  // final String? colorHex;

  Category({
    required this.id,
    required this.name,
    required this.type,
    required this.allocatedAmount,
    // this.iconName,
    // this.colorHex,
  });

  // Method to convert Category to a Map (e.g., for Firestore)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.toString(), // Store enum as string
      'allocatedAmount': allocatedAmount,
      // 'iconName': iconName,
      // 'colorHex': colorHex,
    };
  }

  // Factory constructor to create a Category from a Map (e.g., from Firestore)
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      type: CategoryType.values.firstWhere(
            (e) => e.toString() == json['type'] as String,
            orElse: () => CategoryType.expense, // Default value if parse fails
      ),
      allocatedAmount: (json['allocatedAmount'] as num).toDouble(),
      // iconName: json['iconName'] as String?,
      // colorHex: json['colorHex'] as String?,
    );
  }
}