import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;

  const AppWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,

        /// Home Indicator
        Positioned(
          bottom: 28.h,
          left: 138.w,
          child: Container(
            width: 100.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
        ),
      ],
    );
  }
}
