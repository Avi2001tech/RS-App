import 'package:e_sale_app/consts/consts.dart';

Widget applogoWidget() {
  return Image.asset(icAdditionalLogo) //icAppLogo
      .box
      .white
      .size(120, 160)
      .padding(EdgeInsets.all(8))
      .rounded
      .make();
}
