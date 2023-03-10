import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';


class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallText({
    super.key,
    required this.text,
    this.color = const Color(0xFFccc7c5),
    this.size=0,
    this.height=1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size==0?Dimensions.font12:size,
        fontWeight: FontWeight.w400,
        color:color,
        height: height,
      ),
    );
  }
}
