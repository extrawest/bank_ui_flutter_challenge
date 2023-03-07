import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/scroll_offset_notifier.dart';

final scrollOffsetProvider =
    StateNotifierProvider<ScrollOffsetNotifier, double>(
  (ref) => ScrollOffsetNotifier(),
);