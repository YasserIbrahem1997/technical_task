import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/main.dart';
import 'package:untitled/view/navgetor-bar.dart';
import 'package:untitled/view/screen/navgetion_screen/badge_screen.dart';
import 'package:untitled/view/screen/navgetion_screen/home_page.dart';
import 'package:untitled/view/screen/navgetion_screen/profile_page.dart';
import 'package:untitled/view_model/bottom_nav_cubit/bottom_nav__cubit.dart';
import 'package:untitled/view_model/bottom_nav_cubit/navigation_states.dart';

import 'enter_score.dart';
import '../navgetion_screen/tennis_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double? score; // Add a variable to store the score
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // using cubit for check the user enter number or no and go next screen
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Stack(
            children: [
              //this check click button and go to screen with NavigationBar
              state.startButtonClicked
                  ? _buildSelectedScreen(state.selectedIndex)
                  :  EnterScore(onStart: (enteredScore) {
                setState(() {
                  score = enteredScore; // Store the score in MainScreen
                });
                context.read<NavigationCubit>().setStartButtonClicked();
              }),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: FullyCustomBottomNavBar(
                  selectedIndex: state.selectedIndex,
                  onItemTapped: (index) => context.read<NavigationCubit>().setSelectedIndex(index),
                ),
              ),
            ],
          );
        },
      ),
    );
  }


  // this builder for NavigationBar between Screens  and this screens clickable
  Widget _buildSelectedScreen(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return HomePage(progressValue: score); // Pass score to HomePage
      case 1:
        return TennisScreen();
      case 2:
        return BadgeScreen();
      case 3:
        return ProfilePage();
      default:
        return HomePage(progressValue: score); // Pass score to HomePage
    }
  }
}