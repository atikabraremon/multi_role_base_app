import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role_base_app/screen/admin_screen.dart';
import 'package:multi_role_base_app/screen/singup_screen.dart';
import 'package:multi_role_base_app/screen/student_screen.dart';
import 'package:multi_role_base_app/screen/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool("isLogin") ?? false;
    String userSelect = sp.getString("userType") ?? "";
    if (isLogin) {
      if (userSelect == "Admin") {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdminScreen()),
          );
        });
      } else if (userSelect == "Teacher") {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TeacherScreen()),
          );
        });
      } else if (userSelect == "Student") {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StudentScreen()),
          );
        });
      }
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SingUpScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage(
            "https://images.pexels.com/photos/302457/pexels-photo-302457.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1s"),
      ),
    );
  }
}
