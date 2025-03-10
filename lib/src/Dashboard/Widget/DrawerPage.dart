import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/utils/core/helper/route_helper.dart';
import 'package:hellotaxi/utils/images.dart';
import 'package:hellotaxi/utils/styles.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                        ),
                        padding: const EdgeInsets.all(3),
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
                            style: nameBold,
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            '8250214569', // Replace with dynamic email
                            style: ubuntuMedium,
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
                  image: '', // No image
                  onTap: () {
                    Get.toNamed(RouteHelper.getProfileRoute());
                  },
                ),
                _drawerItem(
                  icon: Icons.info_outlined,
                  text: 'About Hello Taxi',
                  image: '', // No image
                  onTap: () {},
                ),
                _drawerItem(
                  icon: Icons.privacy_tip,
                  text: 'Privacy Policy',
                  image: '', // No image
                  onTap: () {},
                ),
                const Divider(),
                _drawerItem(
                  icon: null, // No icon, only image
                  image: Images.sos, // Provide the image
                  text: 'SOS',
                  onTap: () {},
                ),

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
                    style: ubuntuSemiBold,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _drawerItem({
  IconData? icon, // Make icon optional
  required String text,
  required String image,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (icon != null) Icon(icon, color: Colors.indigo), // Show icon only if it's not null
          if (image.isNotEmpty) Image.asset(image, width: 24, height: 24,color: Colors.indigo), // Ensure image size
          const SizedBox(width: 8.0),
          Text(text, style: change),
        ],
      ),
    ),
  );
}

