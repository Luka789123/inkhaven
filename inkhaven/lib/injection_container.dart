import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:inkhaven/feature/signup_authenticate_feature/presentation/business_logic_holder/login_cubit/cubit/login_cubit.dart';
import 'package:inkhaven/feature/signup_authenticate_feature/presentation/business_logic_holder/signup_cubit/cubit/sign_up_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //BLoC
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => SignUpCubit());
}
