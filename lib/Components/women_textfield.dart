import 'package:flutter/material.dart';
class CustomField extends StatelessWidget {
  // const CustomField({Key? key}) : super(key: key);

  final String? hintText;
  final TextEditingController?controller;

  final String? Function(String?)? validate;
  final String? Function(String?)? onsave;
  final int? maxLines;
  final bool isPassword;
  final bool enable;
  final bool? check;
  final TextInputType? keyboardtype;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;
  final bool readOnly;

  CustomField(
      {
        this.controller,
        this.check,
        this.enable = true,
        this.readOnly = false,
        this.focusNode,
        this.hintText,
        this.isPassword = false,
        this.keyboardtype,
        this.maxLines,
        this.onsave,
        this.prefix,
        this.suffix,
        this.textInputAction,
        this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable==true? true : enable,
      minLines: maxLines==null ? 1: maxLines,
      onSaved: onsave,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: keyboardtype==null? TextInputType.name:keyboardtype,
      controller: controller,
      validator: validate,
      obscureText: isPassword==false?false:isPassword,


      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        labelText: hintText?? "hint text",
        focusedBorder: OutlineInputBorder(

          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Theme.of(context).primaryColor,
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Color(0xFF5DA0BB),
            )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Theme.of(context).primaryColor,
            )
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Colors.red,
            )
        ),
      ),

    );
  }
}
