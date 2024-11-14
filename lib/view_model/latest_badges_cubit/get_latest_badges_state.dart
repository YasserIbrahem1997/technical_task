
import 'package:flutter/cupertino.dart';

@immutable
abstract class GetLatestBadgesState {}

class GetLatestBadgesInitial extends GetLatestBadgesState {
  @override
  String toString() {
    return 'GetLatestBadgesInitial: No badges loaded yet.';
  }
}

class GetLatestBadgesStateLoading extends GetLatestBadgesState {
  @override
  String toString() {
  return 'GetLatestBadgesLoaded: Badges loaded successfully.';
  }

}

class GetLatestBadgesStateLoaded extends GetLatestBadgesState {
  @override
  String toString() {
    return 'GetLatestBadgesLoaded: Badges loaded successfully.';
  }
  final List<String> images;

  GetLatestBadgesStateLoaded(this.images);
}

class GetLatestBadgesStateError extends GetLatestBadgesState {
  final String message;

  GetLatestBadgesStateError(this.message);
}
