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

          file: videoFile,
          index: controller.currentPlayingIndex,
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
    required this.index,
  });

  @override
  State<_Individual> createState() => _IndividualState();
}

class _IndividualState extends State<_Individual> {
  @override
  void initState() {
    super.initState();
    final url = html.Url.createObjectUrl(widget.file);
    final videoElement = html.VideoElement()
      ..src = url
      ..controls = true
      ..autoplay = false;

    ui.platformViewRegistry.registerViewFactory(
      'videoElement${widget.index}',
      (int viewId) => videoElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 600,
      height: 400,
      child: HtmlElementView(viewType: 'videoElement${widget.index}'),
    );
  }
}
