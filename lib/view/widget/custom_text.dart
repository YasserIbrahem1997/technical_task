import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String text;
  TextAlign? textAlign;
  double height;
  int? maxLines;
  TextOverflow? textOverflow;
  TextDecoration? decoration;
  Color? colorDecoration;


  CustomText(
      {Key? key,
        required this.text,
        this.decoration,
        this.textAlign,
        this.colorDecoration,
        this.color = Colors.white,
        required this.fontSize,
        this.fontWeight = FontWeight.normal,
        this.height = 1,
        this.maxLines = 2,
        this.textOverflow})
      : super(key: key);

  Color color;
  double fontSize;
  FontWeight fontWeight;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:textAlign,
      style: GoogleFonts.balooBhaijaan2(
        textStyle: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: decoration,
            decorationColor: colorDecoration,
            decorationThickness: 8,
            decorationStyle:
            TextDecorationStyle.solid,
            height: height,
          )
      ),
      maxLines: maxLines,
      overflow: textOverflow,
      softWrap: true,
    );
  }
}
