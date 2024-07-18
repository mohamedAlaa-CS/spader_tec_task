import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spader_tec_task/features/video/presentation/manager/cubit/video_cubit.dart';
import 'package:spader_tec_task/features/video/presentation/views/widgets/video_player_widget.dart';

class ReelsView extends StatelessWidget {
  const ReelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoCubit, VideoState>(
      listener: (context, state) {},
      builder: (context, state) {
        var videoCubit = VideoCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: state is GetVideoLoading
              ? const Center(child: CircularProgressIndicator())
              : PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: videoCubit.pageController,
                  itemCount: videoCubit.videos.length,
                  itemBuilder: (context, index) {
                    return VideoPlayerWidget(
                      videoUrl: videoCubit.videos[index].videoUrl ?? '',
                    );
                  },
                ),
        );
      },
    );
  }
}
