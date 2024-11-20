import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:videoweb/practice1/picked_video_controller.dart';
import 'dart:html' as html;

import 'package:videoweb/practice1/platform_not_supported_text.dart';

class WebVideoPickerCard extends StatefulWidget {
  final WebPickedVideoController controller;

  const WebVideoPickerCard({
    super.key,
    required this.controller,
  });

  @override
  State<WebVideoPickerCard> createState() => _WebVideoPickerCardState();
}

class _WebVideoPickerCardState extends State<WebVideoPickerCard> {
  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return const PlatformNotSupportedText();
    return const Placeholder();
  }
}
