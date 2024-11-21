import 'dart:developer';
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';
import 'dart:html' as html;

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
      builder: (_, __) {
        final videoFile = controller.mayGetCurrentVideo();
        if (videoFile == null) {
          return const SizedBox();
        }
        return _Individual(
          key: ValueKey(controller.currentPlayingIndex),
          file: videoFile,
          index: controller.currentPlayingIndex, // Ensures unique index
        );
      },
    );
  }
}

class _Individual extends StatefulWidget {
  final html.File file;
  final int? index;

  const _Individual({
    super.key,
    required this.file,
    this.index,
  });

  @override
  State<_Individual> createState() => _IndividualState();
}

class _IndividualState extends State<_Individual> {
  String? videoUrl;

  @override
  void initState() {
    super.initState();
    log(widget.file.name);

    // Safeguard against null index for unique viewType
    final viewType = 'videoElement${widget.index ?? DateTime.now().millisecondsSinceEpoch}';

    // Create the Blob URL
    videoUrl = html.Url.createObjectUrl(widget.file);

    // Create and configure the video element
    final videoElement = html.VideoElement()
      ..src = videoUrl ?? ""
      ..controls = true
      ..muted = true
      ..autoplay = true;

    // Register the video element with the unique viewType
    ui.platformViewRegistry.registerViewFactory(
      viewType,
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
    // Safeguard for unique viewType
    final viewType = 'videoElement${widget.index ?? DateTime.now().millisecondsSinceEpoch}';

    return SizedBox(
      width: 600,
      height: 400,
      child: HtmlElementView(viewType: viewType),
    );
  }
}
