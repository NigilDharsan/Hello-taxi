import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/src/Dashboard/Controller/dashBoardController.dart';
import 'package:hellotaxi/src/Dashboard/Widget/ChooseDropAndPickup/Drop.dart';
import 'package:hellotaxi/src/Dashboard/Widget/ChooseDropAndPickup/Pickup.dart';
import 'package:hellotaxi/utils/images.dart';

Widget MainDesign() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            // setState(() {
            //   ispinkSelected = !ispinkSelected;
            // });
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.black),
              color: Colors.indigo[100],
              // ispinkSelected ? Colors.indigo[100] : Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.carimage, width: 50, height: 50),
                const SizedBox(width: 8.0),
                const Text(
                  'Local',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const PickupPage(),
        const DropPage(),
        Row(
          crossAxisAlignment: CrossAxisAlignment
              .center, // Aligns items vertically at the center
          children: [
            Checkbox(
              value: true,
              onChanged: (bool? value) {
                // setState(() {
                //   isChecked = value ?? false;
                // });
              },
            ),
            const SizedBox(width: 1), // Space between checkbox and image
            Image.asset(
              Images.carimage,
              width: 40, // Increased width for better visibility
              height: 40,
              fit: BoxFit.cover,
            ),

            const SizedBox(width: 1), // Space between image and text
            Expanded(
              child: Text(
                "Please confirm if pets are accompanying you\n"
                "Note: Additional charges will apply",
                textAlign: TextAlign.left, // Aligns text to the left
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
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
              Get.find<DashBoardController>().screenType.value = "Book Rider";
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Continue',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
