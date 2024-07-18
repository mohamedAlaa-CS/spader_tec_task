import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spader_tec_task/di.dart';
import 'package:spader_tec_task/features/video/data/repos/video_repo_imple.dart';
import 'package:spader_tec_task/features/video/presentation/manager/cubit/video_cubit.dart';
import 'package:spader_tec_task/features/video/presentation/views/reels_view.dart';

void main() {
  initInj();
  runApp(const VideoApp());
}

class VideoApp extends StatelessWidget {
  const VideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => VideoCubit(videoRepoImple()),
        child: const ReelsView(),
      ),
    );
  }
}
