import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/utils/images.dart';

import '../../../utils/core/helper/route_helper.dart';
import '../../../utils/styles.dart';
import '../controller/auth_controller.dart';
import '../model/profile_model.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  final Map<String, String> _userData = {
    'firstname': '',
    'lastname': '',
  };

  Future<bool> login() async {
    if (!_formKey.currentState!.validate()) {
      return false; // Return false if validation fails
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    try {
      final updateUser = ProfileData(
        id: 'customer_id',
        firstname: _firstnameController.text.trim(),
        lastname: _lastnameController.text.trim(),
      );

      await Get.find<AuthController>().editProfile();
      Get.offAllNamed(RouteHelper.getDashBoardRoute());

      return true;
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update user information.'),
        ),
      );
      return false;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  InputDecoration inputDecoration(String hintText, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.indigo, size: 24),
      hintText: hintText,
      hintStyle: ubuntuRegular,
      filled: true,
      fillColor: Colors.white,
      counterText: "",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.indigo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _firstnameController,
                          style: quality,
                          decoration: inputDecoration('First Name', Icons.person),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter first name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _lastnameController,
                          style: quality,
                          decoration: inputDecoration('Last Name', Icons.person),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter last name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: _isLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text(
                              'Submit',
                              style: ubuntuBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
