import 'package:to_do_list_app_flutter/models/onboarding_info.dart';

class OnboardingController {
  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/todo_logo1.png', 'Welcome',
        'Now you can make your to-do list\nany time in your mobile.'),
    OnboardingInfo('assets/images/todo_logo2.png', 'Smart to-do list',
        'You can store, edit and delete your to-do list.'),
    OnboardingInfo('assets/images/todo_logo3.png', 'Smart to-do list',
        'You can store, edit and delete your to-do list.'),
  ];
}
