import 'package:flutter/material.dart';

class divider_ extends StatelessWidget {
  const divider_({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 5, // Space above and below the line
      thickness: 2, // Thickness of the line
      color: Colors.white, // Color of the line
      indent: 20, // Space to the left of the line
      endIndent: 20, // Space to the right of the line
    );
  }
}
