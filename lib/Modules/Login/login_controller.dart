import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:state_extended/state_extended.dart';
import 'package:template_2025/Modules/Home/home_screen.dart';
import 'package:template_2025/Utilities/router_config.dart';
import 'package:template_2025/Utilities/shared_preferences.dart';

import 'login_data_handler.dart';

class LoginController extends StateXController {
  // singleton
  factory LoginController()=> _this ??= LoginController._();
  static LoginController? _this;
  LoginController._();

  Future getUser()async{
    final result = await LoginDataHandler.getCurrentUser();

    result.fold(
            (l){
              print(l.errorModel.toString());
            },
            (r){

              SharedPref.saveCurrentUser(user: r);

              currentContext_!.pushReplacementNamed(HomeScreen.routeName);

            });
  }
}
