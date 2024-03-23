// ignore_for_file: unused_field

part of 'token_entity.dart';

final class Token {
  final String _accessToken;
  final DateTime _accessTokenValidTo;
  final String _refreshToken;
  final DateTime _refreshTokenValidTo;

  Token(
      {required String accessToken,
      required DateTime accessTokenValidTo,
      required String refreshToken,
      required DateTime refreshTokenValidTo})
      : _accessToken = accessToken,
        _accessTokenValidTo = accessTokenValidTo,
        _refreshToken = refreshToken,
        _refreshTokenValidTo = refreshTokenValidTo;
}
