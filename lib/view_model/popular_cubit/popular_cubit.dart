import 'package:flutter_bloc/flutter_bloc.dart';

import 'popular_state.dart';

// Cubit for managing image list
class GetPopularCubit extends Cubit<GetPopularState> {
  GetPopularCubit() : super(GetPopularCubitInitial());

  Future<void> loadImages() async {
    print("object");
    try {
      emit(GetPopularStateLoading());
      await Future.delayed(Duration(seconds: 2));

      final images = [
        "assets/images/png/tree.png",
       "assets/images/png/course-with_golf_club.png",

      ];

      print("Images loaded: $images"); // Debug print
      emit(GetPopularStateLoaded(images));
    } catch (e) {
      print("Error loading images: $e"); // Debug print for errors
      emit(GetPopularStateError("Failed to load images"));
    }
  }
}
