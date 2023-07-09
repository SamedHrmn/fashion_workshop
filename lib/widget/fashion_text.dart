import 'package:fashion_workshop/constant/color_constant.dart';
import 'package:flutter/material.dart';

class FashionText extends StatelessWidget {
  const FashionText({
    super.key,
    required this.text,
    required this.size,
    this.textColor = ColorConstant.textBlack,
    this.maxLines,
    this.textAlign = TextAlign.center,
  });

  final String text;
  final double size;
  final Color textColor;
  final int? maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: size, color: textColor),
    );
  }
}
