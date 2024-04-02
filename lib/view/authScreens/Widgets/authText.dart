import 'package:flutter/material.dart';
// import 'package:service/consts/consts.dart';

class AuthTextFieldWidget extends StatefulWidget {
  String label;
  String hintText;
  TextInputType keyboardType;
  bool passwordVisible;
  bool iconVisible;
  TextEditingController controller;

  AuthTextFieldWidget(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.keyboardType,
      required this.passwordVisible,
      required this.iconVisible,
      required this.controller})
      : super(key: key);

  @override
  State<AuthTextFieldWidget> createState() => _AuthTextFieldWidgetState();
}

class _AuthTextFieldWidgetState extends State<AuthTextFieldWidget> {
  late bool _isObscure = widget.passwordVisible;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: SizedBox(
              width: size.width,
              height: 50,
              child: TextField(
                controller: widget.controller,
                obscureText: _isObscure,
                keyboardType: widget.keyboardType,
                decoration: InputDecoration(
                  suffixIcon: widget.iconVisible
                      ? IconButton(
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        )
                      : SizedBox(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: widget.label,
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    // fontFamily: inter,
                    // color: black
                  ),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    // fontFamily: inter,
                    // color: grey,
                  ),
                ),
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
