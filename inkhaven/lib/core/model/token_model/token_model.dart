part of '../../entity/token_entity/token_entity.dart';

final class TokenModel extends Token {
  TokenModel(
      {required super.accessToken,
      required super.accessTokenValidTo,
      required super.refreshToken,
      required super.refreshTokenValidTo});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
        accessToken: json['accessToken'],
        accessTokenValidTo: DateTime.parse(json['accessTokenValidTo']),
        refreshToken: json['refreshToken'],
        refreshTokenValidTo: DateTime.parse('refreshTokenValidTo'));
  }
  bool get isAccessTokenValid =>
      super._accessTokenValidTo.isBefore(DateTime.now());
  bool get isRefreshTokenValid =>
      super._refreshTokenValidTo.isBefore(DateTime.now());
  String get getAccessToken => super._accessToken;
  String get getRefreshToken => super._refreshToken;
}
