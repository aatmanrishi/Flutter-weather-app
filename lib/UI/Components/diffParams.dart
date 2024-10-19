import 'package:flutter/material.dart';

class Diffparams extends StatelessWidget {
  final IconData icon;
  final String type;
  final String data;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final TextAlign textAlign;
  final double? fontSize; // Optional font size
  final double? iconSize; // Optional icon size

  const Diffparams({
    super.key,
    required this.icon,
    required this.type,
    required this.data,
    required this.crossAxisAlignment,
    required this.textAlign,
    required this.mainAxisAlignment,
    this.fontSize, // Default is null
    this.iconSize, // Default is null
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Column(
            crossAxisAlignment: crossAxisAlignment,
            children: [
              Icon(
                icon,
                size: iconSize ?? 60, // Use default size if iconSize is null
                color: Colors.white,
              ),
              Text(
                type,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize ?? 18, // Use default size if fontSize is null
                  wordSpacing: 2,
                ),
                textAlign: textAlign,
              ),
              Text(
                data,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize ?? 18, // Use default size if fontSize is null
                  wordSpacing: 2,
                ),
                textAlign: textAlign,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
