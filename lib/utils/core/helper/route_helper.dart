import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/src/auth/signIn/onboard_screen.dart';
import 'package:hellotaxi/src/common/update_screen.dart';
import 'package:hellotaxi/src/splash/controller/splash_controller.dart';
import 'package:hellotaxi/src/splash/splash_screen.dart';
import 'package:hellotaxi/utils/config.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String signIn = '/onboardscreen';

  static const String language = '/language';
  static const String signUp = '/sign-up';
  static const String signUpEstablish = '/sign-up-establish';
  static const String addLocation = '/add-location';
  static const String onBoardScreen = '/onboard-screen';

  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;
  static String getLanguageRoute(String page) => '$language?page=$page';
  static String getSignInRoute() => onBoardScreen;
  static String getAddLocation(int id, int accountId) =>
      '$addLocation?userId=$id&accountId=$accountId';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onBoardScreen, page: () => getRoute(const OnboardScreen())),

    // GetPage(
    //     name: addLocation,
    //     page: () => Update_Location_Sceen(
    //           isEditLocation: false,
    //           userId: Get.parameters['userId']!,
    //           accountId: Get.parameters['accountId'],
    //           addressItems: null,
    //           highlightedIndex: null,
    //         )),

    // GetPage(
    //     // binding: InitialBinding(),
    //     name: html,
    //     page: () => HtmlViewerScreen(
    //         htmlType: Get.parameters['page'] == 'terms_and_conditions'
    //             ? HtmlType.termsAndConditions
    //             : Get.parameters['page'] == 'privacy_policy'
    //                 ? HtmlType.privacyPolicy
    //                 : Get.parameters['page'] == 'help_and_support'
    //                     ? HtmlType.helpAndSupport
    //                     : Get.parameters['page'] == 'about_us'
    //                         ? HtmlType.aboutUs
    //                         : HtmlType.aboutUs)),
    // GetPage(
    //     name: update,
    //     page: () => UpdateScreen(isUpdate: Get.parameters['update'] == 'true')),

    // GetPage(
    //     name: rateReview,
    //     page: () => getRoute(Get.arguments ?? const NotFoundScreen())),

    // GetPage(
    //     name: notLoggedScreen,
    //     page: () => NotLoggedInScreen(fromPage: Get.parameters['fromPage']!)),

    // GetPage(name: profile, page: () => const ProfileScreen()),
    // GetPage(name: driverprofile, page: () => const DriverProfileScreen()),
    // GetPage(name: editProfileScreen, page: () => const EditProfileScreen()),
    // GetPage(name: editLocationScreen, page: () => const EditLocationDetails()),

    // GetPage(
    //     name: markYourLocationScreen,
    //     page: () => MarkLocationDetails(
    //         isAddLocation: Get.parameters['locationFlag'] == 'false',
    //         isEditLocation: false,
    //         addressAccountId: Get.parameters['accountId']!,
    //         userId: Get.parameters['userId']!,
    //         accountId: Get.parameters['accountId']!,
    //         physics: const ScrollPhysics())),
  ];

  static getRoute(Widget navigateTo) {
    double minimumVersion = 1;
    if (Get.find<SplashController>().configModel.data != null) {
      if (GetPlatform.isAndroid) {
        minimumVersion = double.parse(Get.find<SplashController>()
            .configModel
            .data!
            .androidVersion
            .latestApkVersion);
      } else if (GetPlatform.isIOS) {
        minimumVersion = double.parse(Get.find<SplashController>()
            .configModel
            .data!
            .iosVersion
            .latestIpaVersion);
      }
    }
    return Config.appVersion < minimumVersion
        ? const UpdateScreen(isUpdate: true)
        : navigateTo;
  }
}
