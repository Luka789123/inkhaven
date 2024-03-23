part of 'user_barrel.dart';

final class UserProperties {
  final int _id;
  final String _uuid;
  final String _language;
  final bool _mfaStatus;
  final String mfaType;

  UserProperties(
      {required int id,
      required String uuid,
      required String language,
      required bool mfaStatus,
      required this.mfaType})
      : _id = id,
        _uuid = uuid,
        _language = language,
        _mfaStatus = mfaStatus;
}
