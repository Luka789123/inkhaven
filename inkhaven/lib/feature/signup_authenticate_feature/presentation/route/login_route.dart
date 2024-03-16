import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inkhaven/core/widget/call_to_action_button.dart';
import 'package:inkhaven/core/widget/call_to_action_button_secundary.dart';
import 'package:inkhaven/feature/signup_authenticate_feature/presentation/business_logic_holder/login_cubit/cubit/login_cubit.dart';

import '../../../../core/localization/app_localization.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: BlocBuilder<LoginCubit, LoginState>(builder: (_, state) {
        if (state is LoginInitial) {
          return const _LoginRouteBody();
        }
        return const Placeholder();
      }),
    );
  }
}

class _LoginRouteBody extends StatefulWidget {
  const _LoginRouteBody({super.key});

  @override
  State<_LoginRouteBody> createState() => _LoginRouteBodyState();
}

class _LoginRouteBodyState extends State<_LoginRouteBody>
    with SingleTickerProviderStateMixin {
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text:
                      '${AppLocalizations.of(context).translate('login_welcome_message_title')}\n',
                  style: Theme.of(context).textTheme.titleLarge),
              TextSpan(
                  text:
                      '${AppLocalizations.of(context).translate('login_welcome_message_subtitle')}\n',
                  style: Theme.of(context).textTheme.titleMedium),
            ])),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                focusNode: _usernameFocusNode,
                onTapOutside: (p0) {
                  _usernameFocusNode.unfocus();
                },
                decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)
                        .translate('login_email_field_label'))),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                  focusNode: _passwordFocusNode,
                  onTapOutside: (p0) {
                    _passwordFocusNode.unfocus();
                  },
                  decoration: InputDecoration(
                      label: Text(AppLocalizations.of(context)
                          .translate('login_password_field_label')))),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed('/ResetPasswordRoute'),
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('login_forgot_password_label'),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: AppLocalizations.of(context)
                        .translate('login_register_label_1'),
                    style: Theme.of(context).textTheme.labelSmall),
                WidgetSpan(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/SignUpRoute');
                  },
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('login_register_label_2'),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ))
              ])),
              const SizedBox(
                height: 8,
              ),
              CallToActionButton(
                  onTap: () {},
                  child: Text(
                    AppLocalizations.of(context).translate('login_button_text'),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  )),
              const SizedBox(
                height: 20,
              ),
              CallToActionButtonSecundary(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/svg/google.svg',
                    width: 28,
                    height: 28,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
