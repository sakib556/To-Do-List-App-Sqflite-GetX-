import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboarding_controller.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = OnboardingController();
  var screenWidth, screenHeight, screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.aspectRatio;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    var btnBottom, btnRight, circleLeft, circleBottom;
    if (screenWidth > 540) {
      btnBottom = screenHeight / 2;
      btnRight = screenWidth * .1;
      circleLeft = screenWidth / 2;
      circleBottom = screenHeight * .2;
    } else {
      btnBottom = screenHeight * .05;
      btnRight = screenWidth * .1;
      circleLeft = screenWidth * .1;
      circleBottom = screenHeight * .07;
    }
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
                  child: LayoutBuilder(builder: (context, constraints) {
                    var isWidth = context.width;
                    var isHeight = context.height;
                    print("width $isWidth height $isHeight");
                    return isWidth < 435
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
            bottom: circleBottom,
            left: circleLeft,
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
            bottom: btnBottom,
            right: btnRight,
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
      width: 80,
      height: 100,
    );
  }

  Widget titleText({required index}) {
    return Text(
      _controller.onboardingPages[index].title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
