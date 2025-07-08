import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:template_2025/Utilities/theme_helper.dart';
import 'package:template_2025/core/Language/locales.dart';
import '../../Utilities/strings.dart';
import '../../Widgets/app_wrapper.dart';
import './login_controller.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/Login";

  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends StateX<LoginScreen> with SingleTickerProviderStateMixin {
  late LoginController con;

  late TabController _tabController;

  final _emailController = TextEditingController(text: 'sara.emad@gmail.com');
  final _phoneController = TextEditingController(text: '1234567890');
  final _emailPasswordController = TextEditingController();
  final _phonePasswordController = TextEditingController();

  bool _emailError = false;
  bool _emailPasswordError = false;
  bool _phonePasswordError = false;
  bool _obscurePhonePassword = true;
  bool _obscureEmailPassword = true;

  _LoginScreenState() : super(controller: LoginController()) {
    con = controller as LoginController;
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Help?',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      SizedBox(height: 1.h),
                      const Text(
                        'Please enter your credentials below.',
                        style: TextStyle(color: Colors.grey, fontSize: 14,fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                 TabBar(
                    controller: _tabController,
                    indicatorColor: const Color(0xFF37093A),
                    labelColor: const Color(0xFF37093A),
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                    tabs: const [
                      Tab(text: "Phone Number"),
                      Tab(text: "Email"),
                    ],
                  ),

              ],
            ),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: TabBarView(
            controller: _tabController,
            children: [
              /// ------------------ Phone Login ------------------
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                       hintText: '1234567890',
                        prefixText: '+20 ',
                        prefixStyle: const TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextField(
                      controller: _phonePasswordController,
                      obscureText: _obscurePhonePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: _phonePasswordError ? 'Either email or password is incorrect,please try again' : null,
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).push('/EmailInputScreen');
                      },
                      child: const Text('Reset password?', style: TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _phonePasswordError = _phonePasswordController.text.trim().isEmpty;
                          });

                          if (!_phonePasswordError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Phone login successful!")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF37093A),
                          minimumSize: const Size(335, 64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(64),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),

              /// ------------------ Email Login ------------------
              SingleChildScrollView(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                         hintText: 'Email',
                          errorText: _emailError ? 'Email is required' : null,
                          filled: true,
                          fillColor: Colors.grey.shade200,

                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextField(
                        controller: _emailPasswordController,
                        obscureText: _obscureEmailPassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          errorText: _emailPasswordError ? 'Either email or password is incorrect,please try again' : null,

                          filled: true,
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push('/EmailInputScreen');
                        },
                        child: const Text('Reset password?', style: TextStyle(color: Colors.grey)),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _emailError = _emailController.text.trim().isEmpty;
                              _emailPasswordError = _emailPasswordController.text.trim().isEmpty;
                            });

                            if (_emailError || _emailPasswordError) return;

                            try {
                              await con.getUser();
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Login successful!")),
                              );
                            } catch (e) {
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Login failed: $e")),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF37093A),
                            minimumSize: const Size(335, 64),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(64),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
