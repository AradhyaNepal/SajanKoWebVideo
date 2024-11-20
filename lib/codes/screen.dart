import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:videoweb/codes/picked_video_card.dart';
import 'package:videoweb/codes/picked_video_controller.dart';
import 'package:videoweb/codes/platform_not_supported_text.dart';
import 'package:videoweb/codes/playing_video_card.dart';
import 'package:videoweb/codes/video_picker_card.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final controller=WebPickedVideoController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return const PlatformNotSupportedText();
    return  Scaffold(
      body: Column(
        children: [
          WebVideoPickerCard(controller: controller),
          PickedVideoCard(controller: controller),
          PlayingVideoCard(controller: controller),
        ],
      ),
    );
  }
}

