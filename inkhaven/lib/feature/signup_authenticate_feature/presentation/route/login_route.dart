import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
  late final AnimationController _animationController;
  final Tween<double> _sizeTween = Tween<double>(begin: 1, end: 0);
  late final Animation<double> _animation;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 250),
        reverseDuration: Duration(milliseconds: 200));
    _animation = _sizeTween.animate(_animationController);
    _usernameFocusNode.addListener(() {
      if (!_usernameFocusNode.hasFocus && !_passwordFocusNode.hasFocus) {
        _animationController.reverse();
      } else if (_usernameFocusNode.hasFocus) {
        _animationController.forward();
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_usernameFocusNode.hasFocus && !_passwordFocusNode.hasFocus) {
        _animationController.reverse();
      } else if (_passwordFocusNode.hasFocus) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

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
                  onTap: () {},
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
              Align(
                alignment: Alignment.centerRight,
                child: SizeTransition(
                  sizeFactor: _animationController,
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
          )
        ],
      ),
    );
  }
}
