import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SimpleButton extends StatelessWidget {
  final Color? textcolor;
  final double textsize;
  final double height;
  final double width;
  final String title;
  final FaIcon? buttonIcon;
  final VoidCallback onPress;
  final bool loading;
  final Color? buttoncolor;
  const SimpleButton(
      {required this.textcolor,
      this.buttonIcon,
      required this.textsize,
      required this.width,
      this.buttoncolor,
      required this.height,
      required this.title,
      required this.onPress,
      this.loading = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttoncolor,
          // color: Colors.indigo.withOpacity(.7),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.7), // Adjust opacity as needed
          //     // spreadRadius: 0,
          //     // blurRadius: 0,
          //     offset: const Offset(2, 6), // changes position of shadow
          //   ),
          // ],
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (buttonIcon != null) ...[
                      buttonIcon!,
                      const SizedBox(width: 20), // Space between icon and text
                    ],
                    Text(
                      title,
                      style: TextStyle(
                        letterSpacing: 2,
                        color: textcolor,
                        fontSize: textsize,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
