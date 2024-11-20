import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:videoweb/codes/picked_video_controller.dart';
import 'dart:html' as html;

import 'package:videoweb/codes/platform_not_supported_text.dart';
import 'package:videoweb/codes/show_custom_toast.dart';

class WebVideoPickerCard extends StatelessWidget {
  final WebPickedVideoController controller;

  const WebVideoPickerCard({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return const PlatformNotSupportedText();
    return TextButton(
      onPressed: () => pickVideo(context),
      child: const Text("Add"),
    );
  }

  void pickVideo(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      final file = await ImagePickerWeb.getVideoAsFile();
      if (file == null) {
        scaffoldMessenger.showSnackBar(errorSnackBar("File not found."));
        return;
      }
      controller.add(file);
    } catch (e, s) {
      scaffoldMessenger.showSnackBar(errorSnackBar(e.toString()));
      log(e.toString());
      log(s.toString());
    }
  }
}
