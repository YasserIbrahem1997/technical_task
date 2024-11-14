import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/list_icons_path.dart';
import '../view_model/utils/constants.dart';

class FullyCustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const FullyCustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // Main Container for the Navigation Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, -2),
                ),
              ],
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCustomNavItem(iconPaths[0], 0),
                _buildCustomNavItem(iconPaths[1], 1),
                _buildCustomNavItem(iconPaths[2], 2),
                _buildCustomNavItem(iconPaths[3], 3),
              ],
            ),
          ),
          // Positioned selected item outside the Row
          Positioned(
            bottom: 25,
            left: MediaQuery.of(context).size.width * (selectedIndex / 4.35) +
                (MediaQuery.of(context).size.width * 0.1),
            child: _buildSelectedNavItem(iconPaths[
                selectedIndex]), // Dynamically set icon based on selection
          ),
        ],
      ),
    );
  }

  Widget _buildCustomNavItem(String svgPath, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(8),
        child: SvgPicture.asset(
          svgPath,
          color: selectedIndex == index ? Colors.transparent : Colors.grey,
          height: 25,
          width: 24,
        ),
      ),
    );
  }

  Widget _buildSelectedNavItem(String svgPath) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: mainColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.4),
          ),
        ],
      ),
      child: SvgPicture.asset(
        svgPath,
        color: Colors.white,
        height: 25,
        width: 25,
      ),
    );
  }
}
