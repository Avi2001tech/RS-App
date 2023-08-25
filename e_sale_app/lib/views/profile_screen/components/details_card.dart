import '../../../consts/consts.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      "00".text.white.fontFamily(bold).size(16).make(),
      5.heightBox,
      "Orders".text.white.make(),
    ],
  )
      .box
      .white
      .rounded
      .width(width)
      .height(80)
      .padding(const EdgeInsets.all(8))
      .make();
}
