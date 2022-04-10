import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.left,
    required this.right,
    required this.width,
    this.color,
  }) : super(key: key);
  final double width;
  final double left;
  final double right;
  final String title;
  final void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left, right: right),
      child: Container(
        width: width,
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width * 0.09),
          boxShadow: const [
            BoxShadow(
              spreadRadius: 1,
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(-1, -1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: width * 0.05, color: color),
          ),
        ),
      ),
    );
  }
}
