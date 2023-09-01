import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_sale_app/consts/consts.dart';
import 'package:e_sale_app/consts/list.dart';
import 'package:e_sale_app/controllers/auth_controller.dart';
import 'package:e_sale_app/controllers/profile_controller.dart';
import 'package:e_sale_app/services/firestore_services.dart';
import 'package:e_sale_app/views/auth_screen/login_screen.dart';
import 'package:e_sale_app/views/profile_screen/components/details_card.dart';
import 'package:e_sale_app/views/profile_screen/edit_profile_screen.dart';
import 'package:e_sale_app/widgets_common/bg_widget.dart';
import 'package:e_sale_app/widgets_common/bg_widget2.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget2(
      child: Scaffold(
          appBar: AppBar(),
          body: StreamBuilder(
              stream: FirestoreServices.getUser(currentUser!.uid),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(darkBlue),
                    ),
                  );
                } else {
                  var data = snapshot.data!.docs[0];
                  return SafeArea(
                      child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.edit,
                              color: whiteColor,
                            ),
                          ).onTap(() {
                            controller.nameController.text = data['name'];
                            controller.passController.text = data['password'];
                            Get.to(() => EditProfileScreen(
                                  data: data,
                                ));
                          }),
                        ),

                        //account
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              data['imageUrl'] == ''
                                  ? Image.asset(
                                      imgProfile2,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  : Image.network(
                                      data['imageUrl'],
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make(),
                              10.widthBox,
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "${data['name']}"
                                      .text
                                      .size(20)
                                      .fontFamily(bold)
                                      .white
                                      .make(),
                                  5.heightBox,
                                  "${data['email']}".text.white.make(),
                                ],
                              )),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                  color: whiteColor,
                                )),
                                onPressed: () async {
                                  await Get.put(AuthController())
                                      .signoutMethod(context);
                                  Get.offAll(() => const LoginScreen());
                                },
                                child: logout.text.white.make(),
                              ),
                            ],
                          ),
                        ),

                        //score
                        30.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            detailsCard(
                                width: context.screenWidth / 3.4,
                                count: data['cart_count'],
                                title: "in your Cart"),
                            detailsCard(
                                width: context.screenWidth / 3.4,
                                count: data['wishlist_count'],
                                title: "your Wishlist"),
                            detailsCard(
                                width: context.screenWidth / 3.4,
                                count: data['order_count'],
                                title: "your orders"),
                          ],
                        ),
                        20.heightBox,
                        ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: lightGrey,
                            );
                          },
                          itemCount: profileButtonlist.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.asset(
                                profileButtonIcon[index],
                                width: 22,
                              ),
                              title: profileButtonlist[index]
                                  .text
                                  .color(fontGrey)
                                  .fontFamily(bold)
                                  .make(),
                            );
                          },
                        )
                            .box
                            .white
                            .rounded
                            .margin(const EdgeInsets.all(12))
                            .padding(const EdgeInsets.symmetric(horizontal: 16))
                            .shadowSm
                            .make()
                            .box
                            .color(darkBlue)
                            .make(),
                      ],
                    ),
                  ));
                }
              })),
    );
  }
}
