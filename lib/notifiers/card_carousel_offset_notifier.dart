import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardCarouselOffsetNotifier extends StateNotifier<double> {
  CardCarouselOffsetNotifier() : super(0.0);

  void updateScrollOffset(double offset) {
    state = offset;
  }
}