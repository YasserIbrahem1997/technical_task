import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/model/list_color_model.dart';
import 'package:untitled/view/screen/widget_screen/card_info.dart';
import 'package:untitled/view/screen/widget_screen/list_view_badges.dart';
import 'package:untitled/view/widget/custom_boutton.dart';
import 'package:untitled/view/widget/custom_smial_button.dart';
import 'package:untitled/view/widget/custom_text.dart';
import 'package:untitled/view_model/bottom_nav_cubit/bottom_nav__cubit.dart';
import 'package:untitled/view_model/utils/constants.dart';

import '../../../view_model/latest_badges_cubit/get_latest_badges_cubit.dart';
import '../../../view_model/latest_badges_cubit/get_latest_badges_state.dart';
import '../../../view_model/popular_cubit/popular_cubit.dart';
import '../../../view_model/popular_cubit/popular_state.dart';

class HomePage extends StatelessWidget {
  final double? progressValue;

  HomePage({this.progressValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Replaced Spacer with SizedBox to avoid layout issues
              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'GREEN.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textColorGreen,
                        ),
                      ),
                      TextSpan(
                        text: 'MIND',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: subMainColor,
                        ),
                      )
                    ])),
                    SizedBox(width: MediaQuery.of(context).size.width / 5),
                    Badge(
                      child: SvgPicture.asset(
                        "assets/images/svg/notifications.svg",
                        color: mainColor,
                        height: 20,
                        width: 20,
                      ),
                      backgroundColor: Colors.red,
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),
              CardInfo(context, progressValue!),

              SizedBox(height: 50),

              SizedBox(
                width: 330,
                height: 60,
                child: CustomButton(
                  text: "Continue Challenge",
                  onPressed: () {
                    context.read<NavigationCubit>().resetStartButtonClicked();
                  },
                  pathSvg: "assets/images/svg/tennis.svg",
                ),
              ),

              SizedBox(height: 30),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 35),
                child: CustomText(
                  text: "LATEST BADGES",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),

              // List view badges container
              Container(
                alignment: Alignment.centerLeft,
                height: 140,
                padding: EdgeInsets.only(left: 35),
                child: BlocBuilder<GetLatestBadgesCubit, GetLatestBadgesState>(
                  builder: (context, state) {
                    if (state is GetLatestBadgesStateLoading) {
                      return Center(
                          child:
                              CircularProgressIndicator()); // Show loading spinner
                    } else if (state is GetLatestBadgesStateLoaded) {
                      return ListViewBadges(state); // Display the badges
                    } else if (state is GetLatestBadgesStateError) {
                      return Center(
                          child: Text(state.message)); // Show error message
                    }
                    return Container(); // Default case (shouldn't reach here)
                  },
                ),
              ),

              SizedBox(height: 30),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 35),
                child: CustomText(
                  text: "POPULAR CHALENGES",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),

              // List view badges container (duplicate block)
              Container(
                alignment: Alignment.centerLeft,
                height: 120,
                padding: EdgeInsets.only(left: 35),
                child: BlocBuilder<GetPopularCubit, GetPopularState>(
                  builder: (context, state) {
                    if (state is GetPopularStateLoading) {
                      return Center(
                          child:
                              CircularProgressIndicator()); // Show loading spinner
                    } else if (state is GetPopularStateLoaded) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.images.length,
                        // Use the length of the list
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 220,
                            decoration: BoxDecoration(
                                color: badgeColors[index],
                                borderRadius: BorderRadius.circular(20)),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                          style: GoogleFonts.balooBhaijaan2(
                                              textStyle: const TextStyle(
                                                  fontSize: 30,
                                                  height: 0.70,
                                                  fontWeight: FontWeight.bold)),
                                          children: const [
                                            TextSpan(
                                                text: "COIN \n",
                                                style: TextStyle(
                                                  color: backgroundColorOrange,
                                                )),
                                            TextSpan(
                                                text: "TREE",
                                                style: TextStyle(
                                                  color: backgroundColorLight,
                                                )),
                                          ]),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: buttonStartColors[index],
                                      ),
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: "Strat",
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: textColors[index],
                                            ),
                                            Icon(
                                              Icons.north_east_rounded,
                                              size: 12,
                                              color: textColors[index],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                                Expanded(
                                  child: Image.asset(
                                    state.images[index],
                                    fit: BoxFit.cover,
                                    // Display the image based on the list
                                    width: 510,
                                    // You can adjust width and height
                                    height: 550,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          width: 5,
                        ),
                      ); // Display the badges
                    } else if (state is GetPopularStateError) {
                      return Center(
                          child: Text(state.message)); // Show error message
                    }
                    return Container(); // Default case (shouldn't reach here)
                  },
                ),
              ),

              // Replaced Spacer with SizedBox to avoid layout issues
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
