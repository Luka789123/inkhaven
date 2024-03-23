// ignore_for_file: unused_field

part of 'user_barrel.dart';

enum UserRole { admin, user }

class User {
  final String _fullName;
  final String _userName;
  final String _email;
  final UserRole _role;
  final String? _contactNumber;
  final String? _imageUrl;
  final bool _online;
  final DateTime _lastOnlineActivity;
  final UserProperties _userProperties;

  User(
      {required String fullName,
      required String userName,
      required String email,
      required UserRole role,
      required String? contactNumber,
      required String? imageUrl,
      required bool online,
      required DateTime lastOnlineActivity,
      required UserProperties userProperties})
      : _fullName = fullName,
        _userName = userName,
        _email = email,
        _role = role,
        _contactNumber = contactNumber,
        _imageUrl = imageUrl,
        _online = online,
        _lastOnlineActivity = lastOnlineActivity,
        _userProperties = userProperties;
}
