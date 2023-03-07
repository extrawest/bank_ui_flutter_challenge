import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollOffsetNotifier extends StateNotifier<double> {
  ScrollOffsetNotifier() : super(0.0);

  void updateScrollOffset(double offset) {
    state = offset;
  }
}
