import 'package:state_extended/state_extended.dart';

class HomeController extends StateXController {
  // singleton
  factory HomeController()=> _this ??= HomeController._();
  static HomeController? _this;
  HomeController._();

  
}
