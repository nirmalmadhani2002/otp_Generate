import 'dart:math';
import 'package:flutter/material.dart';


class OTPGenerator extends StatefulWidget {
  OTPGenerator({Key? key}) : super(key: key);

  @override
  _OTPGeneratorState createState() => _OTPGeneratorState();
}

class _OTPGeneratorState extends State<OTPGenerator> {
  int length = 8;
  String otp = "";

  void _generateOTP() {
    const String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    Random random = new Random();
    String otp = "";

    for (int i = 0; i < length; i++) {
      otp += chars[random.nextInt(chars.length)];
    }

    setState(() {
      otp = otp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate OTP"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Generate an OTP of user-defined length',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Length: $length',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Slider(
              min: 1,
              max: 20,
              value: length.toDouble(),
              onChanged: (double value) {
                setState(() {
                  length = value.toInt();
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _generateOTP,
              child: Text('Generate OTP'),
            ),
            SizedBox(height: 20.0),
            Text(
              'OTP: $otp',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
