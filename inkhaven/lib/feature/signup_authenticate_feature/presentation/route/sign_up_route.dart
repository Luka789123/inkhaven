import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inkhaven/core/localization/app_localization.dart';
import 'package:inkhaven/feature/signup_authenticate_feature/presentation/business_logic_holder/signup_cubit/cubit/sign_up_cubit.dart';

import '../../../../core/widget/call_to_action_button.dart';
import '../../../../core/widget/call_to_action_button_secundary.dart';

class SignUpRoute extends StatelessWidget {
  const SignUpRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // this is new
      appBar: AppBar(),
      body: BlocBuilder<SignUpCubit, SignUpState>(builder: (_, state) {
        if (state is SignUpInitial) {
          return const _SignUpRouteBody();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}

class _SignUpRouteBody extends StatefulWidget {
  const _SignUpRouteBody();

  @override
  State<_SignUpRouteBody> createState() => _SignUpRouteBodyState();
}

class _SignUpRouteBodyState extends State<_SignUpRouteBody> {
  bool _obscPassword = true;
  bool _obscRepetedPassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: size.height - 88,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)
                              .translate('sign_up_title'),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)
                              .translate('sign_up_subtitle'),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: size.height * 0.60),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)
                                    .translate('sign_up_field_required');
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                label: Text(AppLocalizations.of(context)
                                    .translate('sign_up_first_name'))),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)
                                    .translate('sign_up_field_required');
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                label: Text(AppLocalizations.of(context)
                                    .translate('sign_up_last_name'))),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)
                                    .translate('sign_up_field_required');
                              } else if (!RegExp(
                                      r'^[A-Z0-9. _%+-]+@[A-Z0-9. -]+\. [A-Z]{2,}$.')
                                  .hasMatch(value)) {
                                return AppLocalizations.of(context)
                                    .translate('sign_up_invalid_email');
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                                label: Text(AppLocalizations.of(context)
                                    .translate('sign_up_email'))),
                          ),
                          StatefulBuilder(builder: (_, state) {
                            return TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)
                                      .translate('sign_up_field_required');
                                }
                                return null;
                              },
                              obscureText: _obscPassword,
                              decoration: InputDecoration(
                                label: Text(
                                  AppLocalizations.of(context)
                                      .translate('sign_up_password'),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: IconButton(
                                      onPressed: () {
                                        state(
                                          () {
                                            _obscPassword = !_obscPassword;
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        _obscPassword
                                            ? FontAwesomeIcons.eye
                                            : FontAwesomeIcons.eyeSlash,
                                        size: 15,
                                      )),
                                ),
                              ),
                            );
                          }),
                          StatefulBuilder(builder: (_, state) {
                            return TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)
                                      .translate('sign_up_field_required');
                                }
                                return null;
                              },
                              obscureText: _obscRepetedPassword,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: IconButton(
                                      onPressed: () {
                                        state(() {
                                          _obscRepetedPassword =
                                              !_obscRepetedPassword;
                                        });
                                      },
                                      icon: Icon(
                                        _obscRepetedPassword
                                            ? FontAwesomeIcons.eye
                                            : FontAwesomeIcons.eyeSlash,
                                        size: 15,
                                      )),
                                ),
                                label: Text(
                                  AppLocalizations.of(context)
                                      .translate('sign_up_repeat_password'),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CallToActionButton(
                      onTap: () {
                        _formKey.currentState!.validate();
                      },
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('sign_up_button_text'),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  KeyboardVisibilityBuilder(builder: (context, isVisible) {
                    return Visibility(
                      visible: !isVisible,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CallToActionButtonSecundary(
                            onTap: () {},
                            child: SvgPicture.asset(
                              'assets/svg/google.svg',
                              width: 28,
                              height: 28,
                            )),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
