import 'package:flutter/material.dart';

class CallToActionButton extends StatelessWidget {
  const CallToActionButton({super.key,double buttonHeight = 50,double buttonWidth = 298, required this.onTap, required this.child}) : _buttonHeight = buttonHeight,
  _buttonWidth = buttonWidth;


  const CallToActionButton.small({super.key,double buttonHeight = 50,double buttonWidth = 298, required this.onTap, required this.child}) : _buttonHeight = buttonHeight,
   _buttonWidth = buttonWidth;
    
  final double _buttonWidth;
  final double _buttonHeight;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith((states) =>Theme.of(context).colorScheme.onPrimaryContainer),
        backgroundColor: MaterialStateProperty.resolveWith((states) => Theme.of(context).colorScheme.primary),
       fixedSize: MaterialStateProperty.resolveWith((states) => Size(_buttonWidth, _buttonHeight))
      ),
      onPressed: onTap, child: child);
  }
}