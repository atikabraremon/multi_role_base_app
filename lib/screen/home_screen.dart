import 'package:flutter/material.dart';
import 'package:multi_role_base_app/screen/singup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String email = "", age = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email") ?? "";
    age = sp.getString("age") ?? "";
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Email: "),
                Text(email)
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Age: "),
                Text(age)
              ],
            ),
            const SizedBox(height: 40,),
            InkWell(
              hoverColor: Colors.red,
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SingUpScreen()));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.green),
                child: const Center(child: Text("Logout")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
