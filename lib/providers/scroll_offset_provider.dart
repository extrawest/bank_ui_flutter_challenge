import 'package:flutter_riverpod/flutter_riverpod.dart';

final scrollOffsetProvider =
    StateNotifierProvider<ScrollOffsetNotifier, double>(
  (ref) => ScrollOffsetNotifier(),
);

class ScrollOffsetNotifier extends StateNotifier<double> {
  ScrollOffsetNotifier() : super(0.0);

  void updateScrollOffset(double offset) {
    state = offset;
  }
}
