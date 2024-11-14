import 'package:flutter/material.dart';
import 'package:untitled/view_model/latest_badges_cubit/get_latest_badges_state.dart';

ListView ListViewBadges(GetLatestBadgesStateLoaded state) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: state.images.length, // Use the length of the list
    itemBuilder: (BuildContext context, int index) {
      return Container(
        alignment: Alignment.centerLeft,
        child: Image.asset(
          state.images[index], // Display the image based on the list
          width: 105, // You can adjust width and height
          height: 120,
        ),
      );
    },
    separatorBuilder: (BuildContext context, int index) => SizedBox(
      width: 1,
    ),
  );
}
