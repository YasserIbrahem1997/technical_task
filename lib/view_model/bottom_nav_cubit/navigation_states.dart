class NavigationState {
  final bool startButtonClicked;
  final int selectedIndex;

  NavigationState({required this.startButtonClicked, required this.selectedIndex});

  NavigationState copyWith({bool? startButtonClicked, int? selectedIndex}) {
    return NavigationState(
      startButtonClicked: startButtonClicked ?? this.startButtonClicked,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
