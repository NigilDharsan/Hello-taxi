import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/images.dart';

class MobileOtpPage extends StatefulWidget {

  const MobileOtpPage({super.key});

  @override
  _MobileOtpPageState createState() => _MobileOtpPageState();
}

class _MobileOtpPageState extends State<MobileOtpPage> {
  final List<TextEditingController> _otpControllers =
  List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes =
  List.generate(4, (index) => FocusNode());

  Timer? _timer;
  int _time = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer?.cancel();
    setState(() {
      _time = 30;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_time > 0) {
          _time--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void submitOtp() {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) =>MapPage()), // Ensure `MapPage` exists
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.backgroundImg1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 8,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Please enter the verification code sent to your number',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  'phoneNumber',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: TextField(
                          controller: _otpControllers[index],
                          focusNode: _focusNodes[index],
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1),
                          ],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 3) {
                              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                            }
                          },
                          onSubmitted: (_) {
                            if (index == 3) submitOtp();
                          },
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _time > 0
                        ? Text(
                      'Seconds Remaining: $_time',
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    )
                        : TextButton(
                      onPressed: startTimer,
                      child: const Text(
                        'Resend OTP',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[900],
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: submitOtp,
                    child: const Text(
                      'Verify OTP',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
