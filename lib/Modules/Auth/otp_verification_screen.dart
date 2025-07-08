import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Auth/reset_phone_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  static const String routeName = '/OtpVerificationScreen';
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String otpCode = '';
  int resendCount = 0;

  void verifyOtp() {
    if (otpCode.length != 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the 5-digit code')),
      );
      return;
    }
    GoRouter.of(context).push(ResetPhoneScreen.routeName, extra: widget.email);
  }

  void resendCode() {
    if (resendCount < 2) {
      setState(() => resendCount++);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Code resent (${resendCount}/2)')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Resend limit reached')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Help?', style: TextStyle(color: Colors.red)),
          ),
        ],
        centerTitle: true,
        title: const Text(
          'Verification code',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            /// ✅ مربعات OTP
            PinCodeTextField(
              appContext: context,
              length: 5,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 64,
                fieldWidth: 54,
                activeFillColor: Colors.grey.shade100,
                inactiveFillColor: Colors.grey.shade200,
                selectedFillColor: Colors.white,
                activeColor: Colors.grey[200],
                selectedColor: Colors.grey[200],
                inactiveColor: Colors.grey[200],
              ),
              enableActiveFill: true,
              onChanged: (value) => setState(() => otpCode = value),
              onCompleted: (value) => otpCode = value,
            ),

            const SizedBox(height: 30),

            /// ✅ زر التحقق
            ElevatedButton(
              onPressed: verifyOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF37093A),
                minimumSize: const Size(335, 64),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(64),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: const Text(
                "Verify",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// ✅ زر إعادة الإرسال
            ElevatedButton(
              onPressed: resendCode,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                minimumSize: const Size(335, 64),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(64),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Text(
                'Resend Code (${resendCount}/2)',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
