import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback onPressed;
  final Color iconColor;

  RoundIconButton.large({
    this.icon,
    this.iconColor,
    this.onPressed
  }):size = 60.0;

  RoundIconButton.small({
    this.icon,
    this.iconColor,
    this.onPressed
  }):size = 50.0;

  RoundIconButton({
    this.icon,
    this.iconColor,
    this.onPressed,
    this.size
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10.0
          )
        ],
      ),
      child: RawMaterialButton(
        shape: CircleBorder(),
        elevation: 0.0,
        fillColor: Colors.white,
        child: Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
