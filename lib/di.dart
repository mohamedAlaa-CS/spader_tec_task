import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spader_tec_task/core/APi/end_points.dart';

final getIt = GetIt.instance;

Future<void> initInj() async {
  Dio dio = Dio();
  dio.options.baseUrl = EndPoints.baseUrl;
  dio.options.validateStatus = (i) => true;

  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    request: true,
    responseHeader: false,
    responseBody: true,
    requestHeader: false,
  ));

  getIt.registerSingleton<Dio>(dio);
}
