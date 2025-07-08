import 'package:flutter/material.dart';
import 'package:state_extended/state_extended.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/HomeScreen";

  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends StateX<HomeScreen> {
  _HomeScreenState() : super(controller: HomeController()) {
    con = HomeController();
  }
  late HomeController con;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.extension), label: 'Nerdy Games'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            label: '',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Karam Mohamed',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.notifications_none),
                ],
              ),
              SizedBox(height: 12.h),

              // Chances and Coins
              Row(
                children: [
                  Image.asset('assets/images/heart.png', width: 20.w, height: 20.h),
                  SizedBox(width: 4.w),
                  Text('05'),
                  SizedBox(width: 16.w),
                  Image.asset('assets/images/coin.png', width: 20.w, height: 20.h),
                  SizedBox(width: 4.w),
                  Text('5000'),
                ],
              ),
              SizedBox(height: 20.h),

              // Upgrade Card
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upgrade to Premium !',
                            style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Upgrade for endless quiz fun, an ad-free experience, the advantage of an extra help option in each game to rise to the top and become the ultimate champion!',
                            style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.arrow_forward_ios, color: Colors.white)
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              // Categories row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryItem('assets/images/categories.png', 'Categories'),
                  _buildCategoryItem('assets/images/spin.png', 'Spin to win'),
                  _buildCategoryItem('assets/images/random.png', 'Random Play'),
                ],
              ),
              SizedBox(height: 24.h),

              // Popular Game
              Text('Popular Game', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 12.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  'assets/images/physics_banner.png',
                  width: double.infinity,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),

              // يمكنك إضافة باقي الأقسام مثل Most Played Games هنا
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String imagePath, String label) {
    return Column(
      children: [
        Container(
          width: 64.w,
          height: 64.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Image.asset(imagePath, width: 32.w, height: 32.h),
          ),
        ),
        SizedBox(height: 6.h),
        Text(label, style: TextStyle(fontSize: 12.sp))
      ],
    );
  }
}
