import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role_base_app/screen/student_screen.dart';
import 'package:multi_role_base_app/screen/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'admin_screen.dart';


class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  var userTypeList = ["Admin", "Teacher", "Student"];
  String selectUserType = "Student";

  final fromData = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sing Up"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Age",
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            DropdownButton(
              isExpanded: true,
              value: selectUserType,
              icon: const Icon(Icons.keyboard_arrow_down),
              // hint: const Text("Select User Type"),
              items: userTypeList.map((items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (newValue) {
                selectUserType = newValue!;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              hoverColor: Colors.red,
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("email", emailController.text.toString());
                sp.setString("age", ageController.text.toString());
                sp.setString("userType", selectUserType);
                sp.setBool("isLogin", true);
                if (sp.getString("userType") == "Admin") {
                  Timer(const Duration(seconds: 3), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AdminScreen()),
                    );
                  });
                } else if (sp.getString("userType") == "Teacher") {
                  Timer(const Duration(seconds: 3), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TeacherScreen()),
                    );
                  });
                } else if (sp.getString("userType") == "Student") {
                  Timer(const Duration(seconds: 3), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StudentScreen()),
                    );
                  });
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.green),
                child: const Center(child: Text("Sing Up")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
