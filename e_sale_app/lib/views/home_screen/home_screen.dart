import 'package:e_sale_app/consts/consts.dart';
import 'package:e_sale_app/consts/list.dart';
import 'package:e_sale_app/widgets_common/home_buttons.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Components/featured_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenHeight,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchany,
                  hintStyle: TextStyle(color: textfieldGrey)),
            ),
          ),
          10.heightBox,
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount: slidersList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image.asset(
                          slidersList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(EdgeInsets.symmetric(horizontal: 8))
                            .make(),
                      );
                    }),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      2,
                      (index) => homeButtons(
                            width: context.screenWidth / 2.5,
                            height: context.screenHeight * 0.15,
                            icon: index == 0 ? icTodaysDeal : icFlashDeal,
                            title: index == 0 ? todaydeal : flashsale,
                          )),
                ),
                10.heightBox,
                VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount: secondSliderList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image.asset(
                          secondSliderList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(EdgeInsets.symmetric(horizontal: 8))
                            .make(),
                      );
                    }),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      3,
                      (index) => homeButtons(
                            width: context.screenWidth / 3.5,
                            height: context.screenHeight * 0.15,
                            icon: index == 0
                                ? icTopCategories
                                : index == 1
                                    ? icBrands
                                    : icTopSeller,
                            title: index == 0
                                ? topCategories
                                : index == 1
                                    ? brand
                                    : topSellers,
                          )),
                ),
                10.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: featuredCategory.text
                      .color(darkFontGrey)
                      .size(18)
                      .fontFamily(semibold)
                      .make(),
                ),
                20.heightBox,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        3,
                        (index) => Column(
                              children: [
                                featuredButton(
                                    icon: featuredImages1[index],
                                    title: featuredTitles1[index]),
                                10.heightBox,
                                featuredButton(
                                    icon: featuredImages2[index],
                                    title: featuredTitles2[index]),
                              ],
                            )).toList(),
                  ),
                ),
                20.heightBox,
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: const BoxDecoration(color: darkBlue),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      featuredProd.text.white.fontFamily(bold).size(18).make(),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              6,
                              (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 4))
                                      .roundedSM
                                      .padding(EdgeInsets.all(8))
                                      .make()),
                        ),
                      ),
                    ],
                  ),
                ),
                20.heightBox,
                VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount: secondSliderList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image.asset(
                          secondSliderList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make(),
                      );
                    }),
                20.heightBox,
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 300),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP5,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          const Spacer(),
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
                          .make();
                    })
              ],
            ),
          )),
        ],
      )),
    );
  }
}
