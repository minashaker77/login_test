import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  InputBox(
      {required this.onSaved,
      required this.imageIcon,
      required this.textEditingController,
      required this.obscureText,
      required this.validator,
      required this.hintText});
  final Widget imageIcon;
  final bool obscureText;
  final String hintText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(
            image: AssetImage('assets/Rectangle1.png'), fit: BoxFit.fill),
      ),
      child: Center(
        child: TextFormField(
          onSaved: widget.onSaved,
          validator: widget.validator,
          obscureText: widget.obscureText,
          controller: widget.textEditingController,
          textAlign: TextAlign.left,
          cursorColor: Colors.white,
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Menlo'),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 10, right: 0, top: 30, bottom: 1),
              errorStyle: TextStyle(fontSize: 12, height: 0.9),
              hintText: widget.hintText,
              labelStyle: TextStyle(
                color: Color(0xff00EFD6),
                fontSize: 15,
              ),
              prefixIcon: widget.imageIcon,
              prefixIconConstraints:
                  BoxConstraints(minWidth: 40, maxHeight: 50),
              hintMaxLines: 1,
              filled: true,
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
        ),
      ),
    );
  }
}
