import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hellotaxi/src/auth/model/profile_model.dart';
import 'package:hellotaxi/src/auth/signIn/userInfoScreen.dart';
import 'package:hellotaxi/utils/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/controller/auth_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobilenumberController = TextEditingController();
  var _isLoading = false;
  var _genderLoading = true;
  String? gender = 'Male';
  String? firstname;
  String? lastname;
  String? email;
  String? female;


  @override
  void initState() {
    super.initState();
    final profileData = ProfileData(); // Assuming ProfileData() has user details
    _firstnameController.text = profileData.firstname ?? '';
    _lastnameController.text = profileData.lastname ?? '';
    _mobilenumberController.text = profileData.mobile ?? '';
    _emailController.text = profileData.email ?? '';
    gender = profileData.gender ?? 'Male'; // Set default gender if null
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _mobilenumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  final Map<String, String> userData = {
    'mobileno': '',
    'name': '',
    'email': '',
    'gender': '',
  };

  InputDecoration getInputDecoration(
    String hintText,
  ) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.indigo,
          width: 2,
        ),
      ),
      hintText: hintText,
      hintStyle: vertical,
      errorStyle: vertical1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.lerp(Colors.indigo[900]!, Colors.indigo[900]!, 0.5),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Edit Profile',
          style: ubuntuBold,
        ),
      ),
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 17.0, bottom: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'First Name',
                                style: colorBold,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                '*',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.indigo,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: _firstnameController,
                          decoration: getInputDecoration('Enter your First name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your First name';
                            } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                              return 'Name must contain only letters';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                          ],
                          onSaved: (value) {
                            userData['name'] = value.toString();
                          },
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 17.0, bottom: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Last Name',
                                style: colorBold,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                '*',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.indigo,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: _lastnameController,
                          decoration: getInputDecoration('Enter your Last name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Last name';
                            } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                              return 'Name must contain only letters';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                          ],
                          onSaved: (value) {
                            userData['name'] = value.toString();
                          },
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 17.0, bottom: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mobile Number',
                                style: colorBold,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                '*',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.indigo,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: _mobilenumberController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: getInputDecoration('Enter your mobile number'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your mobile number';
                            } else if (value.length != 10) {
                              return 'Mobile number must be 10 digits';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userData['mobileno'] = value.toString();
                          },
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 17.0, bottom: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: colorBold,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                '*',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.indigo,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: getInputDecoration('Enter your email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                          },
                          onSaved: (value) {
                            userData['email'] = value.toString();
                          },
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 17.0, bottom: 2),
                          child: Text(
                            'Gender',
                            style: colorBold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.all(1),
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Male',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          _genderLoading = false;
                                          gender = value;
                                          userData['gender'] = value!;
                                        });
                                      },
                                      activeColor: Colors.indigo,
                                    ),
                                    const Text(
                                      'Male',
                                      style: ubuntuMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Female',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          _genderLoading = false;
                                          gender = value;
                                          userData['gender'] = value!;
                                        });
                                      },
                                      activeColor: Colors.indigo,
                                    ),
                                    const Text(
                                      'Female',
                                      style: ubuntuMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 2),
                      SizedBox(
                        width: double.infinity,
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            _formKey.currentState!.save();
                            setState(() {
                              Get.find<AuthController>().editProfile();
                              _isLoading = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                          ),
                          child: const Text(
                            'Update',
                            style: ubuntuBold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
