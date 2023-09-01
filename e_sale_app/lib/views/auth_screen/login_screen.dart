import 'package:e_sale_app/consts/consts.dart';
import 'package:e_sale_app/consts/list.dart';
import 'package:e_sale_app/controllers/auth_controller.dart';
import 'package:e_sale_app/views/home_screen/home.dart';
import 'package:e_sale_app/views/auth_screen/signup_screen.dart';
import 'package:e_sale_app/widgets_common/applogo_widget.dart';
import 'package:e_sale_app/widgets_common/bg_widget.dart';
import 'package:e_sale_app/widgets_common/custom_textfield.dart';
import 'package:e_sale_app/widgets_common/our_button.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.25).heightBox,
          applogoWidget(),
          // "Log in to".text.make(),
          // "$appname"
          //     .text
          //     .fontFamily(bold)
          //     .underline
          //     .italic
          //     .blue900
          //     .size(18)
          //     .make(),
          5.heightBox,
          Obx(
            () => Column(
              children: [
                "Log in to".text.make(),
                "$appname"
                    .text
                    .fontFamily(bold)
                    .underline
                    .italic
                    .blue900
                    .size(18)
                    .make(),
                5.heightBox,
                customTextField(
                    title: email,
                    hint: emailHint,
                    isPass: false,
                    controller: controller.emailController),
                customTextField(
                    title: password,
                    hint: passwordHint,
                    isPass: true,
                    controller: controller.passwordController),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: forgetPassword.text.purple900.make())),
                2.heightBox,
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(darkBlue),
                      )
                    : ourButton(
                        color: darkBlue,
                        textcolor: whiteColor,
                        title: login,
                        onPress: () async {
                          controller.isLoading(true);

                          await controller
                              .loginMethod(context: context)
                              .then((value) {
                            if (value != null) {
                              VxToast.show(context, msg: loggedin);
                              Get.offAll(() => const Home());
                            } else {
                              controller.isLoading(false);
                            }
                          });
                        }).box.width(context.screenWidth / 3).height(39).make(),
                createNewAccount.text.black.fontFamily(bold).tight.make(),
                ourButton(
                    color: whiteColor,
                    textcolor: darkBlue,
                    title: NewAccount,
                    onPress: () {
                      Get.to(() => const SignupScreen());
                    }).box.width(context.screenWidth - 70).make(),
                3.heightBox,
                loginwith.text.black.fontFamily(bold).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              //radius: 25,
                              child: Image.asset(
                                socialIconList[index],
                                width: 30,
                              ),
                            ),
                          )),
                ),
              ],
            )
                .box
                .orange300
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ),
          8.heightBox,
        ],
      )).scrollVertical(),
    ));
  }
}
