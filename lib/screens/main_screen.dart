import 'package:bank_ui_app/common/magic_numbers.dart';
import 'package:bank_ui_app/providers/card_carousel_offset_provider.dart';
import 'package:bank_ui_app/widgets/details_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/assets.dart';
import '../providers/scroll_controller_provider.dart';
import '../widgets/app_bottom_bar.dart';
import '../widgets/card_sliver.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [purple, deepBlue],
            transform: GradientRotation(gradientRotation),
          ),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final carouselOffset = ref.watch(cardCarouselOffsetProvider);
            final height = MediaQuery.of(context).size.height;
            return Stack(
              children: [
                Positioned(
                  top: getTopOffsetOfBigNode(height, carouselOffset),
                  left: getLeftOffsetOfBigNode(carouselOffset),
                  child: Transform.rotate(
                    angle: -carouselOffset * 0.7,
                    child: Image.asset(bigCircleNode, scale: 0.7),
                  ),
                ),
                Positioned(
                  top: getTopOffsetOfSmallNode(height, carouselOffset),
                  right: getRightOffsetOfSmallNode(carouselOffset),
                  child: Image.asset(circleNode, scale: 1.2),
                ),
                child ?? const SizedBox.shrink(),
              ],
            );
          },
          child: SafeArea(
            child: Consumer(builder: (context, ref, _) {
              return Padding(
                padding: const EdgeInsets.only(top: 50),
                child: CustomScrollView(
                  controller: ref.watch(scrollControllerProvider),
                  physics: const ClampingScrollPhysics(),
                  slivers: const [CardSliver(), DetailsSliver()],
                ),
              );
            }),
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const AppBottomBar(),
    );
  }
}
