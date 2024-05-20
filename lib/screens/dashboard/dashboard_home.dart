import 'package:flutter/material.dart';
import 'package:spoonshare/screens/admin/admin_home.dart';
import 'package:spoonshare/screens/dashboard/dashboard_page.dart';
import 'package:spoonshare/screens/ngo/ngo_home.dart';
import 'package:spoonshare/screens/volunteer/volunteer_home.dart';
import 'package:spoonshare/widgets/bottom_navbar.dart';

class DashboardHomePage extends StatelessWidget {
  final String role;

  const DashboardHomePage({Key? key, required this.role}) : super(key: key);

  void navigateToRoleScreen(BuildContext context) {
    switch (role) {
      case 'Volunteer':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const VolunteerHomeScreen(),
          ),
        );
        break;
      case 'NGO':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NGOHomeScreen(),
          ),
        );
        break;
      case 'Admin':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminHomeScreen(),
          ),
        );
        break;
      default:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardPage(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToRoleScreen(context);
    });
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 80,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: backgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: textColor,
            ), // Show a loading indicator while navigating
            const SizedBox(height: 16),
            Text(
              'Redirecting...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
