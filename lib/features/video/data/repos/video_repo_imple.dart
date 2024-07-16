import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spader_tec_task/core/APi/api_services.dart';
import 'package:spader_tec_task/core/APi/end_points.dart';
import 'package:spader_tec_task/core/errors/failuer.dart';
import 'package:spader_tec_task/features/video/data/models/video_model.dart';
import 'package:spader_tec_task/features/video/data/repos/video_repo.dart';

class videoRepoImple implements VideoRepo {
  @override
  Future<Either<Failure, List<VideoModel>>> getVideos() async {
    try {
      var response = await ApiServices.get(endPoint: EndPoints.reels);
      List<VideoModel> videos = [];

      for (var item in response['data']) {
        videos.add(VideoModel.fromJson(item));
      }
      return Right(videos);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure(error.response!.data['message']));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
