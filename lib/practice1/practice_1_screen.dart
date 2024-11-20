import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:videoweb/practice1/platform_not_supported_text.dart';

class Practice1Screen extends StatelessWidget {
  const Practice1Screen({super.key});

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

