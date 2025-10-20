import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geography_geyser/core/app_spacing.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const Center(child: Text("📘 Module Page")),
    const Center(child: Text("👤 Profile Page")),
  ];

  void _onTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedItemColor: Color(0xFF007BFF),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: 'Module',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- Profile Card ---
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),

                  AppSpacing.w16,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Simon Anderson',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        AppSpacing.h4,
                        Row(
                          children: [
                            Icon(
                              Icons.emoji_events_outlined,
                              color: Colors.orange,
                              size: 18,
                            ),

                            AppSpacing.w4,
                            Text(
                              "XP: 39,900",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        AppSpacing.h8,
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white,
                            border: Border.all(color: Colors.blue, width: 1),
                          ),
                          child: Text(
                            "Strongest Module: Water Cycle",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.blue[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            AppSpacing.h20,

            // --- Stats Cards (2x2 Grid) ---
            Row(
              children: [
                Expanded(
                  child: InfoCard(
                    icon: Icons.blinds_outlined,
                    title: 'Average Score',
                    value: '85%',
                  ),
                ),

                AppSpacing.w12,
                Expanded(
                  child: InfoCard(
                    icon: Icons.local_fire_department_outlined,
                    title: 'Daily Quiz Streak',
                    value: '08',
                  ),
                ),
              ],
            ),

            AppSpacing.h12,
            Row(
              children: [
                Expanded(
                  child: InfoCard(
                    icon: Icons.query_stats_outlined,
                    title: 'Total Attempt Quiz',
                    value: '130',
                  ),
                ),

                AppSpacing.w12,
                Expanded(
                  child: InfoCard(
                    icon: Icons.access_time,
                    title: 'Last Activity',
                    value: '2 hrs ago\nTopic: Globalization',
                  ),
                ),
              ],
            ),

            AppSpacing.h20,

            // --- Action Buttons ---
            ActionButton(
              icon: Icons.bar_chart_outlined,
              label: 'Student Stats',
            ),
            ActionButton(icon: Icons.quiz_outlined, label: 'Take a Quiz'),
            ActionButton(
              icon: Icons.settings_outlined,
              label: 'Module Settings',
            ),
          ],
        ),
      ),
    );
  }
}

/// ✅ Custom Info Card Widget
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          AppSpacing.h6,
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
          ),

          AppSpacing.h4,

          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

/// ✅ Reusable Button Card
class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActionButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade300, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black87),
          AppSpacing.w12,
          Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
