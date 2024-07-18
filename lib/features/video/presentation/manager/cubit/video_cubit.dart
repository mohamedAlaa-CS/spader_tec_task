import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spader_tec_task/features/video/data/models/video_model.dart';
import 'package:spader_tec_task/features/video/data/repos/video_repo.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(this.videoRepo) : super(VideoInitial()) {
    getVideos();
  }

  PageController pageController = PageController();

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
}
