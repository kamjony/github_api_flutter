import 'package:get/get.dart';
import 'package:github_api/pages/details/details_bindings.dart';
import 'package:github_api/pages/details/details_view.dart';
import 'package:github_api/pages/home/home_bindings.dart';
import 'package:github_api/pages/home/home_view.dart';

import 'routes.dart';

class RoutesGenerator {
  static final List<GetPage> routes = [
    GetPage(
        name: Routes.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.DETAILS,
        page: () => DetailsView(),
        binding: DetailsBinding(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500))
  ];
}