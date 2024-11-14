import 'package:flutter/material.dart';

import '../../view_model/utils/constants.dart';

class CustomSmialButton extends StatelessWidget {
  String text;
  IconData? icon;
  VoidCallback? onPressed;

  CustomSmialButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: subMainColor, // background
          // foreground
        ),
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(text,
                  style: const TextStyle(
                      fontSize: 5,
                      color: colorBlack,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                width: 2,
              ),
               Icon(
                icon,
                size: 10,
              )
            ],
          ),
        ));
  }
}
