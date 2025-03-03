import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/utils/core/helper/route_helper.dart';
import 'package:hellotaxi/utils/images.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Drawer(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getProfileRoute());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            border: Border.all(
                              // Correct way to apply a border
                              color: Colors.indigo,
                              width: 2, // Adjust thickness
                            ),
                          ),
                          padding: const EdgeInsets.all(3),
                          // Optional: Add padding inside the box
                          child: Image.asset(
                            Images.user,
                            width: 60,
                            height: 60,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nigil', // Replace with dynamic user data
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '8250214569', // Replace with dynamic email
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  _drawerItem(
                      icon: Icons.person,
                      text: 'My Account',
                      onTap: () {
                        Get.toNamed(RouteHelper.getProfileRoute());
                      }),
                  _drawerItem(
                      icon: Icons.info_outlined,
                      text: 'About Hello Taxi',
                      onTap: () {}),
                  _drawerItem(
                      icon: Icons.privacy_tip,
                      text: 'Privacy Policy',
                      onTap: () {}),
                  const Divider(),
                  _drawerItem(icon: Icons.sos, text: 'SOS', onTap: () {}),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Version 1.1',
                      textAlign: TextAlign.end,
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

Widget _drawerItem(
    {required IconData icon,
    required String text,
    required VoidCallback onTap}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.indigo),
          const SizedBox(width: 8.0),
          Text(text,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 13)),
        ],
      ),
    ),
  );
}
