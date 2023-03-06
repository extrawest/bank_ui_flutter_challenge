import 'package:bank_ui_app/providers/card_carousel_offset_provider.dart';
import 'package:bank_ui_app/widgets/details_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/assets.dart';
import '../providers/scroll_controller_provider.dart';
import '../providers/scroll_offset_provider.dart';
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
            stops: [0.0267, 1.0026],
            colors: [purple, deepBlue],
            transform: GradientRotation(150.11 * 3.141592 / 180),
          ),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final carouselOffset = ref.watch(cardCarouselOffsetProvider);
            final height = MediaQuery.of(context).size.height;
            return Stack(
              children: [
                Positioned(
                  top: height / 2 - 200 - carouselOffset * 30,
                  left: -100 - carouselOffset * 60,
                  child: Transform.rotate(
                    angle: -carouselOffset * 0.7,
                    child: Image.asset(bigCircleNode, scale: 0.7),
                  ),
                ),
                Positioned(
                  top: height / 3 - 150 + carouselOffset * 60,
                  right: 50 - carouselOffset * 60,
                  child: Image.asset(circleNode, scale: 1.2),
                ),
                child ?? const SizedBox.shrink(),
              ],
            );
          },
          child: SafeArea(
            child: Consumer(builder: (context, ref, _) {
              final controller = ref.watch(scrollControllerProvider);
              controller.addListener(() {
                ref
                    .read(scrollOffsetProvider.notifier)
                    .updateScrollOffset(controller.offset);
              });
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
