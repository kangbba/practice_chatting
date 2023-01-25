import 'package:flutter/material.dart';
import 'package:practicechatting/duration.dart';
import 'package:practicechatting/sign_in_screen.dart';
import 'package:practicechatting/sign_up_screen.dart';
import 'main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

enum SignStatus
{
  signIn,
  signUp,
}

late Size screenSize;
late SignStatus nowSignStatus;
late SignInScreen signInScreen;
late SignUpScreen signUpScreen;

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    nowSignStatus = SignStatus.signIn;
    // TODO: implement initState
    signInScreen = SignInScreen();
    signUpScreen = SignUpScreen();
  }
  @override
  Widget build(BuildContext context) {
    print(nowSignStatus);
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
          centerTitle: true,
        ),
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              AnimatedSwitcher(
                duration: halfSecond,
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeOut,
                child: _getProperSignPage(nowSignStatus),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            switch(nowSignStatus)
            {
              case SignStatus.signIn:
                nowSignStatus = SignStatus.signUp;
                break;
              case SignStatus.signUp:
                nowSignStatus = SignStatus.signIn;
                break;
              default:
                break;
            }
          });
        }
    )
    );

  }

  Widget _getProperSignPage(SignStatus signStatus) {

    switch(signStatus)
    {
      case SignStatus.signIn:
        return signInScreen;
      case SignStatus.signUp:
        return signUpScreen;
      default:
        throw Exception("");
    }
  }
}
