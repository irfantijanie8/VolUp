import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login/login_page.dart';
import 'package:flutter_application_1/pages/signup/components/signup_auth_provider.dart';
import 'package:flutter_application_1/route/routing_page.dart';
import 'package:flutter_application_1/widgets/my_button.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage ({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController fullname = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  bool visibility = true;
  @override
  Widget build(BuildContext context) {


    SignupAuthProvider signupAuthProvider = Provider.of<SignupAuthProvider>(context);



    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text( // add const
                "Sign Up",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  TextFormField(
                    controller: fullname,
                    decoration: const InputDecoration( // add const
                      hintText: "Full name"
                    ),
                  ),
                  TextFormField(
                    controller: emailAddress,
                    decoration: const InputDecoration( // add const
                      hintText: "Email address",
                    ),
                  ),
                  TextFormField(
                    obscureText: visibility,
                    controller: password,
                    decoration: InputDecoration( // add const
                      hintText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        }, 
                        icon: Icon(
                          visibility ?  Icons.visibility_off: Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  signupAuthProvider.loading==false
                  ? MyButton(
                    onPressed: (){
                      signupAuthProvider.signupValidation(
                        fullname: fullname, 
                        context: context,
                        emailAddress: emailAddress, 
                        password: password,
                      );
                    }, 
                    text: "SIGN UP",
                  )
                : Center(
                  child: CircularProgressIndicator(),
                  ),
                  const SizedBox( // add const
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      Text("Already have an account?\t\t"),
                      GestureDetector(
                        onTap: (){
                          RoutingPage.goTonext(
                            context: context,
                            navigateTo: LoginPage(),
                          );
                        }, 
                        child: Text("LOGIN"),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}