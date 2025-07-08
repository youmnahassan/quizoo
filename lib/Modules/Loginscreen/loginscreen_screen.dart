import 'package:flutter/material.dart';
import 'package:state_extended/state_extended.dart';
import './loginscreen_controller.dart';

class LoginscreenScreen extends StatefulWidget {
  static const routeName = "/Loginscreen";

  const LoginscreenScreen({super.key});

  @override
  State createState() => _LoginscreenScreenState();
}

class _LoginscreenScreenState extends StateX<LoginscreenScreen> {
  _LoginscreenScreenState() : super(controller: LoginscreenController()) {
    con = LoginscreenController();
  }
  late LoginscreenController con;


  @override
  Widget build(BuildContext context) {
  return const Placeholder();
  }
}