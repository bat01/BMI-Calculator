import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function pressed;

  RoundIconButton({@required this.icon, @required this.pressed});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        elevation: 0.0,
        child: Icon(icon),
        onPressed: pressed,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
      ),
    );
  }
}
