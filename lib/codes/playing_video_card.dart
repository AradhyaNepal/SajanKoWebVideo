import 'package:flutter/material.dart';
import 'package:videoweb/codes/picked_video_controller.dart';

class PlayingVideoCard extends StatelessWidget {
  final WebPickedVideoController controller;

  const PlayingVideoCard({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: builder,
    );
  }
}
