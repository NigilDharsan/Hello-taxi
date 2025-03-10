import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hellotaxi/Utils/core/helper/route_helper.dart';
import 'package:hellotaxi/Utils/core/initial_binding/initial_binding.dart';
import 'package:hellotaxi/utils/Loader/Loader.dart';
import 'package:hellotaxi/utils/Loader/LoaderController.dart';
import 'package:hellotaxi/utils/app_constants.dart';
import 'package:hellotaxi/utils/data/provider/client_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.put<SharedPreferences>(sharedPreferences); // Register it in GetX

  Get.lazyPut<ApiClient>(() => ApiClient(
      sharedPreferences: Get.find(), appBaseUrl: '')); // Register ApiClient

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  Get.put(LoaderController()); //

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.indigo, // Set the status bar color
    statusBarIconBrightness: Brightness.light, // Light icons for contrast
    systemNavigationBarColor: Colors.white, // Make bottom navigation bar transparent
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.white, // Remove divider color
  ));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // final String? bookingID;
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    print("object");
  }

  @override
  void dispose() {
    // Clean up lifecycle observer when widget is disposed
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return GetBuilder<ThemeController>(builder: (themeController) {
    //   return GetBuilder<SplashController>(builder: (splashController) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      initialBinding: InitialBinding(),
      // theme: themeController.darkTheme ? dark : light,
      initialRoute: RouteHelper.getSplashRoute(),
      getPages: RouteHelper.routes,
      // defaultTransition: Transition.topLevel,
      // transitionDuration: const Duration(milliseconds: 500),
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            Loader(), // Add the Loader widget here
          ],
        );
      },
    );
    //   });
    // });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
