part of 'video_cubit.dart';

@immutable
sealed class VideoState {}

final class VideoInitial extends VideoState {}

final class GetVideoLoading extends VideoState {}

final class GetVideoSuccess extends VideoState {}

final class GetVideoFailed extends VideoState {
  final String errorMessage;

  GetVideoFailed({required this.errorMessage});
}

final class SkipPrevious extends VideoState {}

final class SkipNext extends VideoState {}

final class PlayOrPause extends VideoState {}

final class VedioController extends VideoState {}
