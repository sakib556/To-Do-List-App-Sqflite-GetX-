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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _controller.onboardingPages[index].imageAsset,
                        width: 140,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        _controller.onboardingPages[index].title,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64.0),
                        child: Text(
                          _controller.onboardingPages[index].description,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
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
}
