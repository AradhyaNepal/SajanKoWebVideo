import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:videoweb/codes/picked_video_controller.dart';
import 'package:videoweb/codes/platform_not_supported_text.dart';

class codesScreen extends StatefulWidget {
  const codesScreen({super.key});

  @override
  State<codesScreen> createState() => _codesScreenState();
}

class _codesScreenState extends State<codesScreen> {
  final controller=WebPickedVideoController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return const PlatformNotSupportedText();
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }
}

