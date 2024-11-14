import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigation_states.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit(bool startButtonClicked)
      : super(NavigationState(
            startButtonClicked: startButtonClicked, selectedIndex: 0));

  void setStartButtonClicked() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("startButtonClicked", true);
    emit(state.copyWith(startButtonClicked: true));
  }

  void resetStartButtonClicked() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("startButtonClicked", false);
    emit(state.copyWith(startButtonClicked: false));
  }

  void setSelectedIndex(int index) {
    if (state.startButtonClicked) {
      emit(state.copyWith(selectedIndex: index));
    }
  }
}
