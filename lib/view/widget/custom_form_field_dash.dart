import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

import '../../view_model/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String? title;
  String? hintText;
  double? fontSize;
  double? fontSizetext;
  Widget? suffixIcon;
  Widget? prefixIcon;
  int? maxLines;
  FormFieldValidator<String>? validator;
  TextInputType? type;
  GestureTapCallback? onTap;
  bool obscureText;
  bool readonly;
  AutovalidateMode? autovalidateMode;
  bool? isCollapsed;
  List<TextInputFormatter>?inputFormatters;
  Color?ColorsText;
  CustomTextField({
    Key? key,
    this.controller,
    this.isCollapsed = false,
    this.readonly = false,
    this.title,
    this.hintText,
    this.fontSize = 12,
    this.fontSizetext ,
    this.ColorsText ,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines,
    this.validator,
    this.type,
    this.onTap,
    this.obscureText = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters:inputFormatters,
      textAlign: TextAlign.center,
      readOnly: readonly,
      onTap: onTap,
      validator: validator,
      cursorColor: Color(0xff909090),
      autovalidateMode: autovalidateMode,
      maxLines: maxLines,
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
      style: TextStyle(
        color: ColorsText,
        fontSize: fontSizetext,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        isCollapsed: isCollapsed,
        contentPadding: EdgeInsets.zero,
        fillColor: Colors.white,
        filled: true,
        errorMaxLines: maxLines,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: title,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xff909090),
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(
          color: Color(0xff909090),
          fontSize: fontSize,
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.merge(
            const BorderSide(
              color: Colors.red,
              width: 0,
              style: BorderStyle.solid,
            ),
            BorderSide(
              color: Colors.red,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        errorStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
