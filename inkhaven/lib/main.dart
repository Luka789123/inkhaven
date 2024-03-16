import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:inkhaven/core/app_theme/app_theme.dart';
import 'package:inkhaven/feature/signup_authenticate_feature/presentation/business_logic_holder/login_cubit/cubit/login_cubit.dart';
import 'package:inkhaven/feature/signup_authenticate_feature/presentation/business_logic_holder/signup_cubit/cubit/sign_up_cubit.dart';
import 'package:inkhaven/route_navigator.dart';
import 'injection_container.dart' as ic;
import 'core/localization/app_localization.dart';
import 'feature/signup_authenticate_feature/presentation/route/welcome_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ic.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => ic.sl<LoginCubit>()),
      BlocProvider(create: (_) => ic.sl<SignUpCubit>()),
    ],
    child: const InkHavenApp(),
  ));
}

class InkHavenApp extends StatelessWidget {
  const InkHavenApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => RouteNavigator.generateRoute(settings),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('hr', 'HR'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      theme: AppTheme.appThemeLight(),
      darkTheme: AppTheme.appThemeDark(),
      home: const InkHavenInitialAppRoute(),
    );
  }
}
