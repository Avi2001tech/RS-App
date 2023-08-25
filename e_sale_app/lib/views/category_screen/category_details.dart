import 'package:e_sale_app/consts/consts.dart';
import 'package:e_sale_app/views/category_screen/item_details.dart';
import 'package:e_sale_app/widgets_common/bg_widget.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.white.fontFamily(bold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        6,
                        (index) => "Baby Clothing"
                            .text
                            .size(13)
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .makeCentered()
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .size(120, 60)
                            .make())),
              ),
              20.heightBox,
              Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 250,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8),
                      itemBuilder: ((context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP1,
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            "Laptop 4GB/64GB"
                                .text
                                .color(darkFontGrey)
                                .fontFamily(semibold)
                                .make(),
                            10.heightBox,
                            "Rs 120"
                                .text
                                .color(darkBlue)
                                .fontFamily(bold)
                                .size(16)
                                .make(),
                          ],
                        )
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .roundedSM
                            .padding(const EdgeInsets.all(8))
                            .make()
                            .onTap(() {
                          Get.to(() => const ItemDetails(title: "Dummy Item"));
                        });
                      }))),
            ],
          ),
        ),
      ),
    );
  }
}
