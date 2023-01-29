import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/login/component/center_part.dart';
import 'package:flutter_application_1/pages/login/component/login_auth_provider.dart';
import 'package:flutter_application_1/pages/login/component/top_part.dart';
import 'package:flutter_application_1/pages/login/component/end_part.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    LoginAuthProvider loginAuthProvider =
        Provider.of<LoginAuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Top part
            TopPart(),
            //Center Part
            CenterPart(
              email: email,
              password: password,
              obscureText: visible,
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
              icon: Icon(
                visible ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            //End part
            EndPart(
              loading: loginAuthProvider.loading,
              onPressed: (){
                loginAuthProvider.loginPageValidation(
                  emailAddress: email, 
                  password: password, 
                  context: context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}