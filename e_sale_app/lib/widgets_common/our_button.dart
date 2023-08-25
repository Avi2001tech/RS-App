import 'package:e_sale_app/consts/consts.dart';

Widget ourButton({onPress, color, textcolor, title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    child: Text(
      title, // Use the title directly as the child of Text widget
      style: TextStyle(
        color: textcolor,
        fontFamily: bold,
      ),
    ),
  );
}
