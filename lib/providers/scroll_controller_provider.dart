import 'package:bank_ui_app/providers/scroll_offset_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scrollControllerProvider = Provider.autoDispose((ref) {
  final controller = ScrollController();

  controller.addListener(() {
    ref.read(scrollOffsetProvider.notifier).updateScrollOffset(controller.offset);
  });

  return controller;
});
