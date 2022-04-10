import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget(
      {Key? key,
      this.maxline,
      required this.left,
      required this.right,
      required this.width,
      this.hinttext,
      this.validator,
      required this.onChanged,
      required this.keyboardType,
      required this.obscureText,
      this.initialvalue,
      this.enabled,
      this.label,
      this.counter,
      this.maxLength})
      : super(key: key);
  final double width;
  final String? hinttext;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? initialvalue;
  final double left;
  final double right;
  final int? maxline;
  final bool? enabled;
  final Widget? label;
  final Widget? counter;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left, right: right),
      child: TextFormField(
        maxLength: maxLength,
        enabled: (enabled == null) ? true : enabled,
        maxLines: maxline,
        initialValue: initialvalue,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        decoration: inputDecoration(hinttext, label, counter, width),
      ),
    );
  }
}

InputDecoration inputDecoration(
    hinttext, Widget? label, Widget? counter, var width) {
  return InputDecoration(
    counter: counter,
    label: label,
    contentPadding: EdgeInsets.symmetric(
        horizontal: width * 0.049, vertical: width * 0.055),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(width * 0.08))),
    enabledBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Color.fromRGBO(255, 255, 243, 1), width: 5),
        borderRadius: BorderRadius.all(Radius.circular(width * 0.1))),
    focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Color.fromRGBO(255, 255, 243, 1), width: 5),
        borderRadius: BorderRadius.all(Radius.circular(width * 0.1))),
    hintText: hinttext,
    hintStyle: TextStyle(color: Colors.white60, fontSize: width * 0.06),
  );
}
