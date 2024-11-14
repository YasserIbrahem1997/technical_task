import 'package:flutter/cupertino.dart';

@immutable
abstract class GetPopularState {}

class GetPopularCubitInitial extends GetPopularState {
  @override
  String toString() {
    return 'GetPopularCubitInitial: No badges loaded yet.';
  }
}

class GetPopularStateLoading extends GetPopularState {
  @override
  String toString() {
    return 'GetPopularCubitLoaded: Badges loaded successfully.';
  }
}

class GetPopularStateLoaded extends GetPopularState {
  final List<String> images;

  GetPopularStateLoaded(this.images);
}

class GetPopularStateError extends GetPopularState {
  final String message;

  GetPopularStateError(this.message);
}
