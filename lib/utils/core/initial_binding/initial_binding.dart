import 'package:get/get.dart';
import 'package:hellotaxi/src/Dashboard/Controller/dashBoardController.dart';
import 'package:hellotaxi/src/auth/controller/auth_controller.dart';
import 'package:hellotaxi/src/auth/repository/auth_repo.dart';
import 'package:hellotaxi/src/splash/controller/splash_controller.dart';
import 'package:hellotaxi/src/splash/repository/splash_repo.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    //common controller
    Get.lazyPut(() => SplashController(
        splashRepo:
            SplashRepo(apiClient: Get.find(), sharedPreferences: Get.find())));
    Get.lazyPut(() => AuthController(
        authRepo:
            AuthRepo(sharedPreferences: Get.find(), apiClient: Get.find())));

    Get.lazyPut(() => DashBoardController());
    // Get.lazyPut(() => SignalRServices());
    // Get.lazyPut(() => StatusController());
    // Get.lazyPut(() => InAppCallController(
    //     inAppCallRepo: InAppCallRepo(apiClient: Get.find())));
  }
}
