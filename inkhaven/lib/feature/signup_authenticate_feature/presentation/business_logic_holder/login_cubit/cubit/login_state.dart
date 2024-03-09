part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginTokenInvalidState extends LoginState {}

final class LoginTokenValidState extends LoginState {}

final class LoginCredentialsValidSate extends LoginState {}

final class LoginCredentialsInvalidState extends LoginState {}
