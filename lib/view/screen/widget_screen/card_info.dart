import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:untitled/view/widget/custom_text.dart';
import 'package:untitled/view_model/utils/constants.dart';

Container CardInfo(BuildContext context , double progressValue) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30),
    height: 225,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        // Upper container with rounded top corners
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          height: 135,
          // Adjust the height for the upper container
          child: Container(
            decoration: BoxDecoration(
              color: subMainColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
          ),
        ),
        // Lower container with rounded bottom corners
        Positioned(
          bottom: -30,
          left: 0,
          right: 0,
          height: 90,
          // Adjust the height for the lower container
          child: Container(
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
          ),
        ),
        // Image positioned at the top center
        Positioned(
          top: 0, // Adjust to control overlap amount
          left: 15,
          bottom: 45,
          child: Image.asset(
            'assets/images/png/boy@3x.png',
            fit: BoxFit.contain,
          ),
        ),

        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 30,right: 25),
            // Controls image overlap with upper container
            child:SvgPicture.asset(
              'assets/images/svg/mark.svg',
              fit: BoxFit.contain,
              height: 50,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
              padding: const EdgeInsets.only(top: 45,left: 20),
              // Controls image overlap with upper container
              child:Column(
                children: [
                  Image.asset("assets/images/png/images-8@3x.png",
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(height: 5,),
                  CustomText(text: "Hi, Omar", fontSize: 18,fontWeight: FontWeight.bold,color: colorBlack,),
                  SizedBox(height: 10,),

                  CustomText(text: "Total Score", fontSize: 10,fontWeight: FontWeight.w500,color: colorBlack,),
                  CustomText(text: progressValue.toString(), fontSize: 35,fontWeight: FontWeight.bold,color: textColorGreen,),

                ],
              )
          ),
        ),
        // Row to display numbers above each step
        // Row to display numbers above each step
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.only(top: 190,left: 40,right: 30),
              // Controls image overlap with upper container
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        8,
                            (index) => CustomText(
                          text:  '${index + 1}',
                          fontSize: 15,
                          color: index < progressValue ? subMainColor : textColorGreen,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  LinearPercentIndicator(

                    width: MediaQuery.of(context).size.width *0.65,
                    widgetIndicator: Container(
                      margin: EdgeInsets.only(top: 3),
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                          color: subMainColor,
                          border: Border.all(

                              color: backgroundColorLight,
                              width: 2
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                    animation: true,
                    animationDuration: 2000,
                    percent: (progressValue -1) / 7, // Progress value (0.0 to 1.0)
                    backgroundColor: textColorGreen, // Background color of the circle
                    progressColor:subMainColor, // Progress color
                    lineHeight: 15, // Adjusted thickness of the progress line
                    barRadius: Radius.circular(10), // Smooth corners for the progress bar

                  ),
                ],
              )
          ),
        ),
      ],
    ),
  );
}
