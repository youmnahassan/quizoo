import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPhoneScreen extends StatefulWidget {
  static const String routeName = '/ResetPhoneScreen';
  final String email;

  const ResetPhoneScreen({super.key, required this.email});

  @override
  State<ResetPhoneScreen> createState() => _ResetPhoneScreenState();
}

class _ResetPhoneScreenState extends State<ResetPhoneScreen> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void resetPhone() {
    if (formKey.currentState!.validate()) {
      GoRouter.of(context).push('/FinalVerifyScreen', extra: widget.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// ✅ AppBar موحد
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
          'Reset Phone Number',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 16),

              /// ✅ الجملة أسفل العنوان
              const Text(
                'Enter your new phone number',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 60),

              /// ✅ حقل إدخال رقم الهاتف
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixText: '+20 ',
                  hintText: '1234567890',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter phone number';
                  if (!RegExp(r'^\+?[0-9]{10,14}$').hasMatch(value)) return 'Invalid number';
                  return null;
                },
              ),

              const SizedBox(height: 30),

              /// ✅ زر Reset
              ElevatedButton(
                onPressed: resetPhone,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF37093A),
                  minimumSize: const Size(335, 64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(64),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
