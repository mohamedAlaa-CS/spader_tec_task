import 'package:dartz/dartz.dart';
import 'package:spader_tec_task/core/errors/failuer.dart';
import 'package:spader_tec_task/features/video/data/models/video_model.dart';

abstract class VideoRepo {
  Future<Either<Failure, List<VideoModel>>> getVideos();
}
