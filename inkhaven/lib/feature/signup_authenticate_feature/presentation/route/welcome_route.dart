import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/localization/app_localization.dart';
import '../../../../core/widget/call_to_action_button.dart';
import '../../../../core/widget/call_to_action_button_secundary.dart';

class InkHavenInitialAppRoute extends StatefulWidget {
  const InkHavenInitialAppRoute({super.key});

  @override
  State<InkHavenInitialAppRoute> createState() => _InkHavenInitialAppRouteState();
}

class _InkHavenInitialAppRouteState extends State<InkHavenInitialAppRoute> with SingleTickerProviderStateMixin {
  final Tween<double> _titleOpacyTween = Tween(begin: 0,end: 1);
  final Tween<Offset> _titlePositionTween = Tween<Offset>(begin: const Offset(0, 0.5),end: Offset.zero);
  final Tween<Offset> _loginButtonPositionTween = Tween<Offset>(begin: const Offset(1, 0),end: Offset.zero);
  final Tween<double> _loginButtonOpacyTween = Tween<double>(begin: 0,end: 1);
  final Tween<Offset> _signUpButtonPositionTween = Tween<Offset>(begin: const Offset(1, 0),end: Offset.zero);
    final Tween<double> _signUpButtonOpacyTween = Tween<double>(begin: 0,end: 1);

  late final AnimationController _animationController;
  late final Animation<double> _titleOpacyAnimation;
  late final Animation<Offset> _titlePositionAnimation;
  late final Animation<double> _loginButtonOpacyAnimation;
  late final Animation<Offset> _loginButtonPositionAnimation;
  late final Animation<double> _signUpButtonOpacyAnimation;
   late final Animation<Offset> _signUpButtonPositionAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration:const Duration(seconds: 1,milliseconds: 500),reverseDuration:const Duration(milliseconds: 200));
    _titleOpacyAnimation = _titleOpacyTween.animate(CurvedAnimation(parent: _animationController, curve: const Interval(0, 0.6,curve: Curves.easeIn)));
    _titlePositionAnimation = _titlePositionTween.animate(CurvedAnimation(parent: _animationController, curve: const Interval(0, 0.62,curve: Curves.easeIn)));
    _loginButtonOpacyAnimation = _loginButtonOpacyTween.animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.4, 0.65,curve: Curves.easeIn)));
    _loginButtonPositionAnimation = _loginButtonPositionTween.animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.3, 0.65,curve: Curves.easeIn)));
    _signUpButtonOpacyAnimation = _signUpButtonOpacyTween.animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.5, 0.7,curve: Curves.easeIn)));
    _signUpButtonPositionAnimation = _signUpButtonPositionTween.animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.55, 0.7,curve: Curves.easeIn)));
    _animationController.forward(); 
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.15),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (_,child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FadeTransition(
                  opacity: _titleOpacyAnimation,
                  child: SlideTransition(
                    position: _titlePositionAnimation,
                    child: Image.asset('assets/images/poster.png',width: size.width * 0.65,height: size.height *0.28,fit: BoxFit.fill,))),
                FadeTransition(
                  opacity: _titleOpacyAnimation,
                  child: SlideTransition(
                    position: _titlePositionAnimation,
                    child: Text.rich(TextSpan(children: [
                      //TODO internacionalizirati
                      TextSpan(
                        text: 'Hello, Welcome to ',
                        style: Theme.of(context).textTheme.titleLarge
                      ),
                      //TODO internacionalizirati
                      TextSpan(
                        text: 'InkHaven',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary)
                      )
                    ]),
                    textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 140),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //TODO internacionalizirati
                      FadeTransition(
                        opacity: _loginButtonOpacyAnimation,
                        child: SlideTransition(
                          position: _loginButtonPositionAnimation,
                          child: CallToActionButton(onTap: (){
                            _animationController.reset();
                            _animationController.forward();
                          }, child: Text(AppLocalizations.of(context).translate('login_button_text'),style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),)),
                        ),
                      ),
                      //TODO internacionalizirati
                      FadeTransition(
                        
                        opacity: _signUpButtonOpacyAnimation,
                        child: SlideTransition(
                          
                          position: _signUpButtonPositionAnimation,
                          child: CallToActionButtonSecundary(onTap: (){}, child:  Text(AppLocalizations.of(context).translate('sign_up_button_text')))),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}