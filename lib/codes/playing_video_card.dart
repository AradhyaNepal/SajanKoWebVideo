import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
import 'package:videoweb/codes/picked_video_controller.dart';
import 'dart:html' as html;

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
      builder: (_, __) {
        final videoFile = controller.mayGetCurrentVideo();
        if (videoFile == null) {
          return const SizedBox();
        }
        return _Individual(
          key: ValueKey(controller.currentPlayingIndex),
          file: videoFile,
        );
      },
    );
  }
}

class _Individual extends StatefulWidget {
  final html.File file;

  const _Individual({
    super.key,
    required this.file,
  });

  @override
  State<_Individual> createState() => _IndividualState();
}

class _IndividualState extends State<_Individual> {
  String? videoUrl;

  @override
  void initState() {
    super.initState();
    videoUrl = html.Url.createObjectUrl(widget.file);

    final videoElement = html.VideoElement()
      ..src = videoUrl ?? ""
      ..controls = true
      ..muted = true
      ..autoplay = true;

    ui.platformViewRegistry.registerViewFactory(
      'videoElement',
      (int viewId) => videoElement,
    );
  }

  @override
  void dispose() {
    if (videoUrl != null) {
      // Revoke the Blob URL to free memory
      html.Url.revokeObjectUrl(videoUrl!);
      videoUrl = null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 600,
      height: 400,
      child: HtmlElementView(viewType: 'videoElement'),
    );
  }
}
