import 'package:bank_ui_app/providers/card_carousel_offset_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/fake_credit_card_provider.dart';

class CardsCarousel extends ConsumerStatefulWidget {
  const CardsCarousel({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CardsCarouselState();
}

class _CardsCarouselState extends ConsumerState<CardsCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final creditCards = ref.watch(fakeCreditCardProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: creditCards,
          options: CarouselOptions(
            scrollPhysics: const ClampingScrollPhysics(),
            viewportFraction: 0.9,
            enableInfiniteScroll: false,
            clipBehavior: Clip.none,
            enlargeCenterPage: true,
            padEnds: false,
            onScrolled: (offset) {
              ref
                  .read(cardCarouselOffsetProvider.notifier)
                  .updateScrollOffset(offset ?? 0);
            },
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: creditCards
              .map(
                (e) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _current == creditCards.indexOf(e) ? 10 : 6,
                  height: _current == creditCards.indexOf(e) ? 10 : 6,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 2,
                        spreadRadius: 0,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
