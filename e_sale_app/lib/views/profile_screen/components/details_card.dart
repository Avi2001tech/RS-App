import '../../../consts/consts.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.black.fontFamily(semibold).size(25).make(),
      5.heightBox,
      title!.text.color(darkBlue).make(),
    ],
  )
      .box
      .white
      .rounded
      .width(width)
      .height(100)
      .padding(const EdgeInsets.all(8))
      .make();
}
