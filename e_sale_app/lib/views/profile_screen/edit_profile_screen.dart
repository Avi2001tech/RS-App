import 'dart:io';

import 'package:e_sale_app/consts/consts.dart';
import 'package:e_sale_app/controllers/profile_controller.dart';
import 'package:e_sale_app/widgets_common/bg_widget.dart';
import 'package:e_sale_app/widgets_common/bg_widget2.dart';
import 'package:e_sale_app/widgets_common/custom_textfield.dart';
import 'package:e_sale_app/widgets_common/our_button.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : data['imageUrl'] != '' &&
                            controller.profileImgPath.isEmpty
                        ? Image.network(
                            data['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.file(
                            File(controller.profileImgPath.value),
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ourButton(
                    color: darkBlue,
                    onPress: () {
                      controller.changeImage(context);
                    },
                    textcolor: whiteColor,
                    title: "change your image"),
                const Divider(
                  color: darkBlue,
                ),
                20.heightBox,
                customTextField(
                    controller: controller.nameController,
                    hint: nameHint,
                    title: name,
                    isPass: false),
                customTextField(
                    controller: controller.passController,
                    hint: password,
                    title: password,
                    isPass: true),
                20.heightBox,
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(darkBlue),
                      )
                    : ourButton(
                        color: darkBlue,
                        onPress: () async {
                          controller.isLoading(true);
                          await controller.uploadProfileImage();
                          await controller.updateProfile(
                              imgUrl: controller.profileImageLink,
                              name: controller.nameController.text,
                              password: controller.passController.text);
                          VxToast.show(context, msg: "updated");
                        },
                        textcolor: whiteColor,
                        title: "Save"),
              ],
            )
                .box
                .gray200
                .padding(const EdgeInsets.all(16))
                .margin(const EdgeInsets.only(top: 40, left: 20, right: 20))
                .rounded
                .make(),
          ),
        ],
      ).scrollVertical(),
    ));
  }
}
