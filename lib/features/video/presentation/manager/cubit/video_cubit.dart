import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:spader_tec_task/features/video/data/models/video_model.dart';
import 'package:spader_tec_task/features/video/data/repos/video_repo.dart';
import 'package:video_player/video_player.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(this.videoRepo) : super(VideoInitial()) {
    getVideos().then((value) {
      playerController = VideoPlayerController.network(
        videos[currentIndex].videoUrl ?? '',
      )..initialize().then(
          (_) {
            emit(VedioController());
          },
        );
    });
  }

  int currentIndex = 0;
  late VideoPlayerController playerController;
//? object from video cubit =================
  static VideoCubit get(context) => BlocProvider.of<VideoCubit>(context);

  final VideoRepo videoRepo;
  //? get list of videos =====================
  List<VideoModel> videos = [];
  Future<void> getVideos() async {
    emit(GetVideoLoading());
    var result = await videoRepo.getVideos();
    result.fold((fail) {
      emit(GetVideoFailed(errorMessage: fail.toString()));
    }, (succes) {
      emit(GetVideoSuccess());
      videos = succes;
    });
  }

//? skip previous  =================
  void skipPreviuse() {
    if (currentIndex == 0) {
      playerController.pause();
      currentIndex = videos.length - 1;
    } else {
      playerController.pause();
      currentIndex--;
    }
    playerController =
        VideoPlayerController.network(videos[currentIndex].videoUrl ?? '')
          ..initialize().then((_) {
            playerController.play();
            emit(SkipPrevious());
          });
  }

//? skip next  =================
  void skipNext() {
    if (currentIndex == videos.length - 1) {
      playerController.pause();
      currentIndex = 0;
    } else {
      playerController.pause();
      currentIndex++;
    }
    playerController = VideoPlayerController.network(
      videos[currentIndex].videoUrl ?? '',
    )..initialize().then((_) {
        playerController.play();
        emit(SkipNext());
      });
  }

//? play or pause =================
  void changeVideoState() {
    if (playerController.value.isPlaying) {
      playerController.pause();
    } else {
      playerController.play();
    }
    emit(PlayOrPause());
  }
}
