import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:videoweb/codes/picked_video_controller.dart';
import 'package:videoweb/codes/platform_not_supported_text.dart';

class PickedVideoCard extends StatelessWidget {
  final WebPickedVideoController controller;

  const PickedVideoCard({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return const PlatformNotSupportedText();
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final data = controller.data;
        final currentPlaying = controller.currentPlayingIndex;
        return Row(
          key: ValueKey(controller.data),
          children: [
            for (int i = 0; i < data.length; i++)
              Builder(builder: (context) {
                final isPlaying = currentPlaying == i;
                return Container(
                  color: Colors.red,
                  margin: const EdgeInsets.only(left: 20),
                  height: 250,
                  width: 250,
                  child: Column(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          controller.remove(i);
                        },
                        child: const Text("Delete"),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          if (isPlaying) return;
                          controller.play(i);
                        },
                        child: Text(isPlaying ? "Is Playing" : "Play"),
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              })
          ],
        );
      },
    );
  }
}
