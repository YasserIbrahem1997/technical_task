import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/view_model/latest_badges_cubit/get_latest_badges_state.dart';


// Cubit for managing image list
class GetLatestBadgesCubit extends Cubit<GetLatestBadgesState> {
  GetLatestBadgesCubit() : super(GetLatestBadgesInitial());

  Future<void> loadImages() async {
    print("object");
    try {
      emit(GetLatestBadgesStateLoading());
      await Future.delayed(Duration(seconds: 2));

      final images = [
        'assets/images/png/genius.png',
        'assets/images/png/ontime.png',
        'assets/images/png/math.png',
        'assets/images/png/sport.png',
        'assets/images/png/math.png',
        'assets/images/png/genius.png',
        'assets/images/png/math.png',
      ];

      print("Images loaded: $images"); // Debug print
      emit(GetLatestBadgesStateLoaded(images));
    } catch (e) {
      print("Error loading images: $e"); // Debug print for errors
      emit(GetLatestBadgesStateError("Failed to load images"));
    }
  }
}
