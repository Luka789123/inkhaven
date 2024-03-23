import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalAuthenticationDataSource {
  final SharedPreferences _sharedPreferences;
  final FlutterSecureStorage _secureStorage;

  LocalAuthenticationDataSource(
      {required SharedPreferences sharedPreferences,
      required FlutterSecureStorage secureStorage})
      : _sharedPreferences = sharedPreferences,
        _secureStorage = secureStorage;

  static const String _ACCESS_TOKEN_KEY = 'ACCESS_TOKEN_KEY';
}
