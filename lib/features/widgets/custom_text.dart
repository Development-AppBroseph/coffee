import 'package:cofee/constants/colors/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum StyleText {
  medium,
  header,
  title,
  description,
}

class CustomText extends StatelessWidget {
  final String title;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  double? fontSize;
  Color color;
  bool? centerTitle;
  CustomText({
    super.key,
    required this.title,
    this.fontWeight = FontWeight.w600,
    this.fontSize,
    this.fontStyle,
    this.centerTitle = false,
    this.color = ColorStyles.blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
      ),
      textAlign: centerTitle! ? TextAlign.center : TextAlign.left,
    );
  }
}
