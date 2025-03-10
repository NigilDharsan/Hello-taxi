import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/src/Dashboard/Controller/dashBoardController.dart';
import 'package:hellotaxi/src/Dashboard/Widget/ChooseDropAndPickup/Drop.dart';
import 'package:hellotaxi/src/Dashboard/Widget/ChooseDropAndPickup/Pickup.dart';
import 'package:hellotaxi/utils/images.dart';
import 'package:hellotaxi/utils/styles.dart';

Widget MainDesign() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 360,
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
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   ispinkSelected = !ispinkSelected;
                    // });
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.black),
                      color: Colors.indigo[100],
                      // ispinkSelected ? Colors.indigo[100] : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Images.carimage, width: 100,),
                        const Text(
                          'Local',
                          style: nameBold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const PickupPage(),
              const DropPage(),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (bool? value) {
                        // Handle checkbox state
                      },
                    ),
                    const SizedBox(width: 1),
                    SizedBox(
                      width: 40,  // Set width explicitly
                      child: Image.asset(
                        Images.dogimage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Please confirm if pets are \naccompanying you\n"
                            "Note: Additional charges will apply",
                        textAlign: TextAlign.left,
                        style: normalBold,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(builder: (context) => const Cash_Screen()),
                      // );
                      Get.find<DashBoardController>().screenType.value =
                          "Book Rider";
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Continue',
                        style: conBold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
