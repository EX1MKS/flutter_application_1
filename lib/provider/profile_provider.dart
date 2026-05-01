import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';

class ProfileProvider extends ChangeNotifier {
  final List<Profile> _profiles = [];

  List<Profile> get profiles => _profiles;

  void addProfile(Profile profile) {
    _profiles.add(profile);
    notifyListeners();
  }

  void updateProfile(int index, Profile profile) {
    _profiles[index] = profile;
    notifyListeners();
  }


  void deleteProfile(int index) {
    _profiles.removeAt(index);
    notifyListeners();
  }
}