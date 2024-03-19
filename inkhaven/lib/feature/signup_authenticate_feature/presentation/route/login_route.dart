import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inkhaven/core/widget/call_to_action_button.dart';
import 'package:inkhaven/core/widget/call_to_action_button_secundary.dart';
import 'package:inkhaven/feature/signup_authenticate_feature/presentation/business_logic_holder/login_cubit/cubit/login_cubit.dart';

import '../../../../core/localization/app_localization.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: size.height),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: _TitleWidget(size: size)),
                Expanded(
                  flex: 2,
                  child: _InputWidget(
                      usernameFocusNode: _usernameFocusNode,
                      passwordFocusNode: _passwordFocusNode),
                ),
              ],
            ),
            const _ButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.05),
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
    );
  }
}

class _InputWidget extends StatefulWidget {
  const _InputWidget({
    super.key,
    required FocusNode usernameFocusNode,
    required FocusNode passwordFocusNode,
  })  : _usernameFocusNode = usernameFocusNode,
        _passwordFocusNode = passwordFocusNode;

  final FocusNode _usernameFocusNode;
  final FocusNode _passwordFocusNode;

  @override
  State<_InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<_InputWidget> {
  bool _obscPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          focusNode: widget._usernameFocusNode,
          onTapOutside: (p0) {
            widget._usernameFocusNode.unfocus();
          },
          decoration: InputDecoration(
              label: Text(AppLocalizations.of(context)
                  .translate('login_email_field_label'))),
        ),
        const SizedBox(
          height: 30,
        ),
        TextField(
            obscureText: _obscPassword,
            focusNode: widget._passwordFocusNode,
            onTapOutside: (p0) {
              widget._passwordFocusNode.unfocus();
            },
            decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscPassword = !_obscPassword;
                      });
                    },
                    icon: Icon(
                      _obscPassword
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      size: 15,
                    ),
                  ),
                ),
                label: Text(AppLocalizations.of(context)
                    .translate('login_password_field_label')))),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/ResetPasswordRoute'),
            child: Text(
              AppLocalizations.of(context)
                  .translate('login_forgot_password_label'),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ),
      ],
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: KeyboardVisibilityBuilder(builder: (_, isVisible) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: !isVisible,
                child: Text.rich(TextSpan(children: [
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
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ))
                ])),
              ),
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
              Visibility(
                visible: !isVisible,
                child: const SizedBox(
                  height: 20,
                ),
              ),
              Visibility(
                visible: !isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: CallToActionButtonSecundary(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/svg/google.svg',
                        width: 28,
                        height: 28,
                      )),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
