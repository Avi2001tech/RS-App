import 'package:e_sale_app/consts/consts.dart';

Widget bgWidget2({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(icAdditionalbkgd2), fit: BoxFit.fill)),
    child: child,
  );
}
