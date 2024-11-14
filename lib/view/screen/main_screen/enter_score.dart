import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/view/screen/main_screen/main_screen.dart';
import 'package:untitled/view/widget/custom_boutton.dart';
import 'package:untitled/view/widget/custom_form_field_dash.dart';
import 'package:untitled/view/widget/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../view_model/utils/constants.dart';

class EnterScore extends StatelessWidget {
  final ValueChanged<double> onStart;

  const EnterScore({Key? key, required this.onStart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController enterNumber = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        color: backgroundColor2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'GREEN.',
                    style: GoogleFonts.balooBhaijaan2(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: textColorGreen,
                    ),
                  ),
                  TextSpan(
                    text: 'MIND',
                    style: GoogleFonts.balooBhaijaan2(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: subMainColor,
                    ),
                  )
                ])),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4.10,
                ),
                SvgPicture.asset(
                  "assets/images/svg/notifications.svg",
                  color: mainColor,
                  height: 20,
                  width: 20,
                ),
              ],
            ),
            Spacer(),
            CustomText(
              text: "Enter your score",
              fontSize: 20,
              color: textColorGreen,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 25,
            ),
            Form(
              key: _formKey,
              child: CustomTextField(
                controller: enterNumber,
                type: TextInputType.number,
                fontSizetext: 40,
                ColorsText: textColorGreen,
                maxLines: 1,
                validator: (value) {
                  // Check if the value is empty
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }

                  // Check if the value is a valid number (integer or decimal)
                  final number = double.tryParse(
                      value); // Allow both integer and decimal numbers
                  if (number == null || number < 0 || number > 8) {
                    return 'Please enter a valid percentage (0-8)';
                  }

                  // Ensure the number does not exceed 2 decimal places
                  if (value.contains('.') && value.split('.')[1].length > 2) {
                    return 'Please enter a percentage with at most 2 decimal places';
                  }
                  return null; // If valid, return null
                },
              ),
            ),
            Spacer(),
            SizedBox(
              height: 60,
              child: CustomButton(
                  text: "Start",
                  pathSvg: "assets/images/svg/tennis.svg",
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      double enteredScore = double.parse(enterNumber.text);
                      onStart(enteredScore); // Pass the score to MainScreen
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
