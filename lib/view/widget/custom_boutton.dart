import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/view_model/utils/constants.dart';

class CustomButton extends StatelessWidget {
  String text;
  String? pathSvg;
  VoidCallback? onPressed;

  CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.pathSvg,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SvgPicture.asset(
                    pathSvg!,
                    color: colorBlack,
                    height: 10,
                    width: 10,
                  ),
            SizedBox(
              width: 10,
            ),
           Text(text,
                    style: const TextStyle(
                        fontSize: 15,
                        color: colorBlack,
                        fontWeight: FontWeight.w600))

          ],
        ));
  }
}
