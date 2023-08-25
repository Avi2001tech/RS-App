import 'package:e_sale_app/consts/consts.dart';
import 'package:e_sale_app/consts/list.dart';
import 'package:e_sale_app/views/category_screen/category_details.dart';
import 'package:e_sale_app/widgets_common/bg_widget.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/nav2/router_outlet.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.white.fontFamily(bold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 250,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      categoryImages[index],
                      height: 120,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                    10.heightBox,
                    categoryList[index]
                        .text
                        .color(darkFontGrey)
                        .align(TextAlign.center)
                        .make(),
                  ],
                )
                    .box
                    .white
                    .roundedSM
                    .outerShadowSm
                    .clip(Clip.antiAlias)
                    .make()
                    .onTap(() {
                  Get.to(() => CategoryDetails(title: categoryList[index]));
                });
              }),
        ),
      ),
    );
  }
}
