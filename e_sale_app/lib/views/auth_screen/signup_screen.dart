import 'dart:ui';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import '../../consts/list.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.25).heightBox,
          //applogoWidget(),
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
          Column(
            children: [
              "Join our Community".text.make(),
              "$appname"
                  .text
                  .fontFamily(bold)
                  .underline
                  .italic
                  .blue900
                  .size(18)
                  .make(),
              10.heightBox,
              customTextField(title: name, hint: nameHint),
              customTextField(title: email, hint: emailHint),
              customTextField(title: password, hint: passwordHint),
              customTextField(title: retypePass, hint: passwordHint),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.purple900.make())),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: List.generate(
              //       3,
              //       (index) => Padding(
              //             padding: const EdgeInsets.all(12.0),
              //             child: CircleAvatar(
              //               backgroundColor: Colors.transparent,
              //               //radius: 25,
              //               child: Image.asset(
              //                 socialIconList[index],
              //                 width: 30,
              //               ),
              //             ),
              //           )),
              // ),
              Row(
                children: [
                  Checkbox(
                    activeColor: darkBlue,
                    checkColor: whiteColor,
                    value: isCheck,
                    onChanged: (newValue) {
                      setState(() {
                        isCheck = newValue;
                      });
                    },
                  ),
                  4.widthBox,
                  Expanded(
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: "I agree to the ",
                          style: TextStyle(
                            fontFamily: semibold,
                            color: Colors.black,
                          )),
                      TextSpan(
                          text: temrsAndcond,
                          style: TextStyle(
                            fontFamily: bold,
                            color: darkBlue,
                          )),
                      TextSpan(
                          text: " & ",
                          style: TextStyle(
                            fontFamily: bold,
                            color: Colors.black,
                          )),
                      TextSpan(
                          text: privPolicy,
                          style: TextStyle(
                            fontFamily: bold,
                            color: darkBlue,
                          )),
                    ])),
                  ),
                ],
              ),
              2.heightBox,
              ourButton(
                      color: isCheck == true ? darkBlue : lightGrey,
                      textcolor: whiteColor,
                      title: signup,
                      onPress: () {})
                  .box
                  .width(context.screenWidth / 3)
                  .height(39)
                  .make(),
              10.heightBox,
              // RichText(
              //     text: const TextSpan(children: [
              //   TextSpan(
              //     text: alrHaveacc,
              //     style: TextStyle(fontFamily: bold, color: fontGrey),
              //   ),
              //   TextSpan(
              //     text: login,
              //     style: TextStyle(fontFamily: bold, color: darkBlue),
              //   )
              // ])).onTap(() {
              //   Get.back();
              // }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  alrHaveacc.text.color(Colors.black).make(),
                  login.text.color(darkBlue).make().onTap(() {
                    Get.back();
                  }),
                ],
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
          8.heightBox,
        ],
      )).scrollVertical(),
    ));
  }
}
