import 'package:e_sale_app/consts/colors.dart';
import 'package:e_sale_app/views/auth_screen/login_screen.dart';
import 'package:e_sale_app/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../widgets_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //change the screen from splash to home
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      //Get.to(() => const LoginScreen());
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const LoginScreen());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue, //redColor
      body: Center(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(icSplashBg, width: 250)),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            tagline.text.italic.size(15).white.make(),
            /*Column(
              children: [
                Text(
                  "\"Tajgi ka Swaad,",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(width: 10), // Add your desired padding here
                Text(
                  "               Sehat ka Khazana\"",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),*/
            Spacer(),
            credits.text.italic.white.make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
