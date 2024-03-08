import 'package:flutter/material.dart';

class CallToActionButtonSecundary extends StatelessWidget {
  const CallToActionButtonSecundary({super.key,double buttonHeight = 50,double buttonWidth = 298, required this.onTap, required this.child}) : _buttonHeight = buttonHeight,
  _buttonWidth = buttonWidth;


  const CallToActionButtonSecundary.small({super.key,double buttonHeight = 50,double buttonWidth = 298, required this.onTap, required this.child}) : _buttonHeight = buttonHeight,
   _buttonWidth = buttonWidth;
    
  final double _buttonWidth;
  final double _buttonHeight;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.fromBorderSide(BorderSide(color: Theme.of(context).colorScheme.primary,width: 2))
      ),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) =>Colors.transparent),
         fixedSize: MaterialStateProperty.resolveWith((states) => Size(_buttonWidth, _buttonHeight))
        ),
        onPressed: onTap, child: child),
    );
  }
}