import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app_flutter/models/onboarding_info.dart';

import '../views/home/home_page.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.off(HomePage());
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/todo_logo1.png', 'Welcome',
        'Now you can make your to-do list any time in your mobile.'),
    OnboardingInfo('assets/images/todo_logo2.png', 'Smart to-do list',
        'You can store, edit and delete your to-do list.'),
    OnboardingInfo('assets/images/todo_logo3.png', 'Finish your every task',
        'Start your first to-do list.After finish every task you should select the left icon.'),
  ];
}
