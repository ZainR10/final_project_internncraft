import 'package:flutter/material.dart';

class UserDetails with ChangeNotifier {
  String _name;
  String _email;
  String _profession;
  String _location;

  UserDetails({
    required String name,
    required String email,
    required String profession,
    required String location,
  })  : _name = name,
        _email = email,
        _profession = profession,
        _location = location;

  // Getters
  String get name => _name;
  String get email => _email;
  String get profession => _profession;
  String get location => _location;

  // Method to update user details
  void updateDetails({
    String? name,
    String? email,
    String? profession,
    String? location,
  }) {
    if (name != null) _name = name;
    if (email != null) _email = email;
    if (profession != null) _profession = profession;
    if (location != null) _location = location;

    notifyListeners();
  }
}
