// lib/models/user_model.dart
class UserModel {
  final String uid;
  final String email;
  final String? displayName;
  // Add other user-specific fields as needed, e.g., photoURL

  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
  });

  // Factory constructor to create a UserModel from Firebase User object
  // This will be more relevant when we integrate Firebase Auth
  // factory UserModel.fromFirebaseUser(User firebaseUser) {
  //   return UserModel(
  //     uid: firebaseUser.uid,
  //     email: firebaseUser.email ?? '',
  //     displayName: firebaseUser.displayName,
  //   );
  // }

  // Method to convert UserModel to a Map (e.g., for Firestore)
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
    };
  }

  // Factory constructor to create a UserModel from a Map (e.g., from Firestore)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
    );
  }
}