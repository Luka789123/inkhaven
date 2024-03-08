import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:inkhaven/core/app_theme/app_theme.dart';

import 'core/localization/app_localization.dart';
import 'feature/signup_authenticate_feature/presentation/route/welcome_route.dart';

void main(){
  runApp(const InkHavenApp());
}


class InkHavenApp extends StatelessWidget {
  const InkHavenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('hr', 'HR'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      theme: AppTheme.appThemeLight(),
      darkTheme: AppTheme.appThemeDark(),
      home: const InkHavenInitialAppRoute(),
    );
  }
}

