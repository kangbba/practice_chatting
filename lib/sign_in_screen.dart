import 'package:flutter/material.dart';
import 'package:practicechatting/size.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          TextFormField(
              cursorColor: Colors.black,
              controller: _emailController,
              decoration: textInputDecor('Email'),
              validator: (text) {
              }
          ),
          TextFormField(
              cursorColor: Colors.black,
              controller: _pwController,
              decoration: textInputDecor('Password'),
              validator: (text) {
              }
          )
        ]
      ),
    );
  }

  InputDecoration textInputDecor(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: activeInputBorder(),
      focusedBorder: activeInputBorder(),
      focusedErrorBorder: errorInputBorder(),
      errorBorder: errorInputBorder(),
      filled: true,
      fillColor: Colors.grey[100],
    );
  }
  OutlineInputBorder activeInputBorder() {
    return OutlineInputBorder(
      borderSide:  BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(gap_s),
    );
  }
  OutlineInputBorder errorInputBorder() {
    return OutlineInputBorder(
      borderSide:  BorderSide(
        color: Colors.redAccent,
      ),
      borderRadius: BorderRadius.circular(gap_s),
    );
  }
}
