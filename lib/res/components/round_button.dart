import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final VoidCallback onPress;
  final bool loading;
  final Color? color;
  const RoundButton(
      {required this.width,
      this.color,
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
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          // color: Colors.indigo.withOpacity(.7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7), // Adjust opacity as needed
              // spreadRadius: 0,
              // blurRadius: 0,
              offset: const Offset(2, 6), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
        ),
      ),
    );
  }
}
