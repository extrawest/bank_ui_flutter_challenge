import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/card_carousel_offset_notifier.dart';

final cardCarouselOffsetProvider =
StateNotifierProvider<CardCarouselOffsetNotifier, double>(
      (ref) => CardCarouselOffsetNotifier(),
);