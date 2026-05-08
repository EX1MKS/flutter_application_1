import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/db_helper.dart';
import 'package:flutter_application_1/models/profile.dart';

class ProfileProvider extends ChangeNotifier {
  List<Profile> _profiles = [];

  List<Profile> get profiles => _profiles;

  ProfileProvider() {
    fetchProfiles();
  }

  Future<void> fetchProfiles() async {
    try{
      _profiles = await DBHelper.getProfiles();
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching profiles: $e');
    }
  }

  Future<void> addProfile(Profile newProfile) async {
    try{
      final int insertedId08 = await DBHelper.insertProfile(newProfile);
      final updatedProfile = newProfile.copyWith(id08: insertedId08);
      _profiles.add(updatedProfile);
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding profile: $e');
    }
  }

  Future<void> updateProfile(int id08, Profile profile) async {
    final db = await DBHelper.database;
    await db.update(
      'tb_profile',
      profile.toMap(),
      where: 'id08 = ?',
      whereArgs: [id08],
    );
    await fetchProfiles();
  }

  Future<void> deleteProfile(int id08) async {
    final db = await DBHelper.database;
    await db.delete('tb_profile', where: 'id08 = ?', whereArgs: [id08]);
    _profiles.removeWhere((p) => p.id08 == id08);
    notifyListeners();
  }
}