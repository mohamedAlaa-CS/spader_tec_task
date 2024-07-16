import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spader_tec_task/features/video/presentation/manager/cubit/video_cubit.dart';
import 'package:spader_tec_task/features/video/presentation/views/widgets/custom_button.dart';
import 'package:video_player/video_player.dart';

class Video extends StatelessWidget {
  const Video({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoCubit, VideoState>(
      listener: (context, state) {},
      builder: (context, state) {
        var videoCubit = VideoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Spader teck task'),
          ),
          body: state is GetVideoLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: videoCubit.playerController.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: 1 / 1.5,
                              child: VideoPlayer(videoCubit.playerController),
                            )
                          : const CircularProgressIndicator(
                              color: Colors.black,
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                            icon: Icons.skip_previous,
                            onPressed: () => videoCubit.skipPreviuse()),
                        CustomButton(
                            icon: videoCubit.playerController.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            onPressed: () => videoCubit.changeVideoState()),
                        CustomButton(
                            icon: Icons.skip_next,
                            onPressed: () => videoCubit.skipNext()),
                      ],
                    )
                  ],
                ),
        );
      },
    );
  }
}
