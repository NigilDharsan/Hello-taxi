import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/utils/core/helper/route_helper.dart';
import 'package:hellotaxi/utils/images.dart';
import 'package:hellotaxi/utils/styles.dart';
import '../Dashboard/Controller/dashBoardController.dart';

class RiderSearchScreen extends StatefulWidget {
  const RiderSearchScreen({super.key});

  @override
  State<RiderSearchScreen> createState() => _RiderSearchScreenState();
}

class _RiderSearchScreenState extends State<RiderSearchScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;
  @override
  void initState() {
    super.initState();
    controller =
    AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..addListener(() {
        setState(() {});
      })
      ..repeat(reverse: true);
    Future.delayed(const Duration(seconds: 5), () {
        Get.toNamed(RouteHelper.bookingscreen);
    });
  }

  @override
  void dispose() {
    controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LinearProgressIndicator(
                            value: determinate ? controller.value : null,
                            semanticsLabel: 'Linear progress indicator',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Image.asset(
                            Images.riderSearch, // Make sure this file exists in your assets folder
                            width: 400,
                            height: 150,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: const Text(
                            "Searching For a driver near you",
                            style: colorBold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.indigo,
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      // Uncomment when needed
                                      // Navigator.of(context).pushReplacement(
                                      //   MaterialPageRoute(
                                      //       builder: (context) => const Booking_Screen()),
                                      // );
                                      // Get.find<DashBoardController>().screenType.value = "booking screen";
                                      Get.find<DashBoardController>()
                                          .screenType
                                          .value = "booking screen";
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text(
                                      "Cancel Ride",
                                      style: conBold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
