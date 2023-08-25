import 'package:e_sale_app/consts/consts.dart';
import 'package:e_sale_app/consts/list.dart';
import 'package:e_sale_app/widgets_common/our_button.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
          title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                )),
          ]),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      aspectRatio: 16 / 9,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc10,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                  10.heightBox,
                  title!.text
                      .size(16)
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    maxRating: 5,
                    size: 25,
                    count: 4,
                    stepInt: true,
                  ),

                  10.heightBox,
                  "Rs 250/kg"
                      .text
                      .color(darkBlue)
                      .fontFamily(semibold)
                      .size(18)
                      .make(),

                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller".text.white.fontFamily(semibold).make(),
                          5.heightBox,
                          "kuch likhega yaha".text.make()
                        ],
                      )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.message_rounded,
                          color: darkFontGrey,
                        ),
                      ),
                    ],
                  )
                      .box
                      .color(darkFontGrey)
                      .height(70)
                      .padding(const EdgeInsets.symmetric(horizontal: 8))
                      .make(),

                  // colour section

                  10.heightBox,
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: "Quantity: ".text.color(textfieldGrey).make(),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.remove)),
                          "0"
                              .text
                              .size(16)
                              .color(fontGrey)
                              .fontFamily(bold)
                              .make(),
                          10.widthBox,
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add)),
                          "(0 available)".text.size(16).color(fontGrey).make(),
                        ],
                      ),
                    ],
                  ).box.padding(const EdgeInsets.all(8)).white.shadowSm.make(),

                  10.heightBox,
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: "Total: ".text.color(textfieldGrey).make(),
                      ),
                      "Rs 0.00"
                          .text
                          .color(darkBlue)
                          .size(16)
                          .fontFamily(semibold)
                          .make(),
                    ],
                  ).box.padding(const EdgeInsets.all(8)).white.shadowSm.make(),

                  10.heightBox,
                  "Description"
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  "This is a dummy data and it will reflect on the screen with product description"
                      .text
                      .color(darkFontGrey)
                      .make(),

                  10.heightBox,
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                        itemDetailsButtonList.length,
                        (index) => ListTile(
                              title: itemDetailsButtonList[index]
                                  .text
                                  .fontFamily(semibold)
                                  .make(),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            )),
                  ),

                  20.heightBox,
                  productsyoumaylike.text
                      .color(darkFontGrey)
                      .fontFamily(bold)
                      .size(16)
                      .make(),

                  10.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          6,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    imgP1,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  10.heightBox,
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
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .roundedSM
                                  .padding(EdgeInsets.all(8))
                                  .make()),
                    ),
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
                color: darkBlue,
                onPress: () {},
                textcolor: whiteColor,
                title: "Add to Cart"),
          ),
        ],
      ),
    );
  }
}
