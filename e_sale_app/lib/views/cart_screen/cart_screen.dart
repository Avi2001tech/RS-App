import 'package:e_sale_app/consts/consts.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: "Cart is empty".text.white.fontFamily(bold).makeCentered(),
    );
  }
}
