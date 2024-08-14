import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCaintainer extends StatelessWidget {
  final double? height;
  final Color? textcolor;
  final double textsize;
  final IconData displayIcon;
  final double? width;
  final String title;
  // final VoidCallback onPress;
  // final bool loading;
  final Color? color;
  const CustomCaintainer(
      {this.width,
      required this.displayIcon,
      required this.textcolor,
      required this.textsize,
      this.color,
      this.height,
      required this.title,
      // required this.onPress,
      // this.loading = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    return Container(
      height: height,
      width: width,
      // margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        // color: Colors.indigo.withOpacity(.7),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              displayIcon,
              size: 35,
            ),
            SizedBox(
              width: width * .01,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textcolor,
                  fontSize: textsize,
                  letterSpacing: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
