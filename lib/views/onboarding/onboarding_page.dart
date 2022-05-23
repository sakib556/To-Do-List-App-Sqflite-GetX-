import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          PageView.builder(
              controller: _controller.pageController,
              itemCount: _controller.onboardingPages.length,
              onPageChanged: _controller.selectedPageIndex,
              itemBuilder: (context, index) {
                return Container(
                  child: OrientationBuilder(builder: (context, orientation) {
                    final isPortrait = orientation == Orientation.portrait;
                    return isPortrait
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              imageAsset(index: index),
                              const SizedBox(
                                height: 30,
                              ),
                              titleText(index: index),
                              const SizedBox(
                                height: 30,
                              ),
                              detailsText(index: index, width: 200),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              imageAsset(index: index),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  titleText(index: index),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  detailsText(index: index, width: 240),
                                ],
                              )
                            ],
                          );
                  }),
                );
              }),
          Positioned(
            bottom: 25,
            left: 25,
            child: Row(
              children: List.generate(
                _controller.onboardingPages.length,
                (index) => Obx(() {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: _controller.selectedPageIndex.value == index
                          ? Colors.red
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            right: 25,
            child: FloatingActionButton(
              elevation: 0,
              onPressed: _controller.forwardAction,
              child: Obx(() {
                return Text(_controller.isLastPage ? 'Start' : 'Next');
              }),
            ),
          ),
        ],
      )),
    );
  }

  Widget imageAsset({required index}) {
    return Image.asset(
      _controller.onboardingPages[index].imageAsset,
      width: 140,
      height: 200,
    );
  }

  Widget titleText({required index}) {
    return Text(
      _controller.onboardingPages[index].title,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  Widget detailsText({required index, required double width}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: width,
        height: 100,
        child: Text(
          _controller.onboardingPages[index].description,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
