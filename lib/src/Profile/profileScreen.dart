import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/utils/core/helper/route_helper.dart';
import 'package:hellotaxi/utils/images.dart';
import 'package:hellotaxi/utils/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor:
            Color.lerp(Colors.indigo[700]!, Colors.indigo[800]!, 0.5),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.toNamed(RouteHelper.getDashBoardRoute());
          },
        ),
        title: const Text(
          'Profile',
          style: con2Bold
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              Images.user,
                              width: 60,
                              height: 60,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Nigil', // Replace with dynamic user data
                                  style: nameBold,
                                ),
                                const SizedBox(height: 4.0),
                                const Text(
                                  '8250214569',
                                  // Replace with dynamic user data
                                  style: ubuntuMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getEditProfileRoute());
                          },
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Edit Profile',
                              style: ubuntuSemiBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        _drawerItem(
                          icon: Icons.directions_car,
                          text: 'Ride History',
                          onTap: () {
                            Get.toNamed(RouteHelper.getRiderHistoryRoute());
                          },
                        ),
                        _drawerItem(
                          icon: Icons.call,
                          text: 'Customer Care',
                          onTap: () {
                            Get.toNamed(RouteHelper.getCustomerCareRoute());
                          },
                        ),
                        _drawerItem(
                          icon: Icons.notifications,
                          text: 'Notifications',
                          onTap: () {
                            Get.toNamed(RouteHelper.getNotificationRoute());
                          },
                        ),
                        _drawerItem(
                          icon: Icons.privacy_tip,
                          text: 'Logout',
                          onTap: () => _showLogoutDialog(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.indigo,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: ubuntuRegular,
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40), // Adds spacing
        child: const Divider(thickness: 1, color: Colors.grey),
      ),
    ],
  );
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Logout',
        style: logBold,),
        content:
            const Text('Are you sure you want to logout this application?',
              style: ubuntuMedium,),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'No',
              style: ubuntuLight,
            ),
          ),
          TextButton(
            onPressed: () {
              Get.offAllNamed(RouteHelper.getSignInRoute());
            },
            child: const Text(
              'Confirm',
              style: ubuntuLight,
            ),
          ),
        ],
      );
    },
  );
}
