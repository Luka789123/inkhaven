import 'package:flutter/material.dart';
import 'package:inkhaven/core/localization/app_localization.dart';
import 'package:inkhaven/core/widget/call_to_action_button.dart';

class ResetPasswordRoute extends StatelessWidget {
  const ResetPasswordRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)
                      .translate('recover_password_route_title'),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    AppLocalizations.of(context)
                        .translate('revocer_password_route_subtitle'),
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text(
                      AppLocalizations.of(context).translate('sign_up_email'))),
            ),
            CallToActionButton(
                onTap: () {},
                child: Text(
                    AppLocalizations.of(context)
                        .translate('recover_password_route_title'),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary)))
          ],
        ),
      ),
    );
  }
}
