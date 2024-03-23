part of '../../entity/user_entity/user_barrel.dart';

class UserModel extends User {
  UserModel(
      {required super.fullName,
      required super.userName,
      required super.email,
      required super.role,
      required super.contactNumber,
      required super.imageUrl,
      required super.online,
      required super.lastOnlineActivity,
      required super.userProperties});

  int get getUderId => super._userProperties._id;
  String get getUserFirstName => super._fullName.split(' ').first;
  String get getUserLastName => super._fullName.split(' ').last;
  String get getUserFullName => super._fullName;
  String get getEmail => super._email;
}
