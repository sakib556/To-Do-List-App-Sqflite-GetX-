import 'package:flutter/material.dart';

import '../../controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);
  final controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: PageView.builder(
              itemCount: controller.onboardingPages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(controller.onboardingPages[index].imageAsset),
                      Text(controller.onboardingPages[index].title),
                      Text(controller.onboardingPages[index].description),
                    ],
                  ),
                );
              })),
    );
  }
}
