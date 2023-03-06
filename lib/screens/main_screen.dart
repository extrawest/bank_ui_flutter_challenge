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
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 2 - 150,
              left: -100,
              child: Image.asset('assets/images/circle.png', scale: 0.5,),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3 - 150,
              right: 50,
              child: Image.asset('assets/images/circle.png', scale: 1.2,),
            ),
            SafeArea(
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
                    slivers: const [
                      CardSliver(),
                      DetailsSliver()
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const AppBottomBar(),
    );
  }
}
