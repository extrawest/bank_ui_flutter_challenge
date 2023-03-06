import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  runApp(
    DevicePreview(
      isToolbarVisible: false,
      enabled: kIsWeb,
      builder: (context) => const ProviderScope(child: BankUIApp()),
    ),
  );
}
