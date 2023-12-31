import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodpanda_users_app/authentication/register.dart';
import 'package:foodpanda_users_app/global/global.dart';
import 'package:foodpanda_users_app/mainScreens/home_screen.dart';
import 'package:foodpanda_users_app/until/colors.dart';
import 'package:foodpanda_users_app/until/images.dart';
import 'package:foodpanda_users_app/until/styles.dart';
import 'package:foodpanda_users_app/widgets/custom_text_field.dart';
import 'package:foodpanda_users_app/widgets/error_dialog.dart';
import 'package:foodpanda_users_app/widgets/loading_dialog.dart';

import 'auth_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  formValidation() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      //login
      loginNow();
    } else {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "Please write email/password.",
            );
          });
    }
  }

  loginNow() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingDialog(
            message: "Checking Credentials",
          );
        });

    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user!;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: error.message.toString(),
            );
          });
    });
    if (currentUser != null) {
      readDataAndSetDataLocally(currentUser!);
    }
  }

  Future readDataAndSetDataLocally(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        if (snapshot.data()!["status"] == "approved") {
          await sharedPreferences!.setString("uid", currentUser.uid);
          await sharedPreferences!
              .setString("email", snapshot.data()!["email"]);
          await sharedPreferences!.setString("name", snapshot.data()!["name"]);
          await sharedPreferences!
              .setString("photoUrl", snapshot.data()!["photoUrl"]);

          List<String> userCartList =
              snapshot.data()!["userCart"].cast<String>();
          await sharedPreferences!.setStringList("userCart", userCartList);

          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const HomeScreen()));
        } else {
          firebaseAuth.signOut();
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg:
                  "Admin has locked your account.\nContact email: admin@gmail.com for more information");
        }
      } else {
        firebaseAuth.signOut();
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const AuthScreen()));

        showDialog(
            context: context,
            builder: (c) {
              return ErrorDialog(
                message: "No record found.",
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              Images.bgLogin,
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Padding(
                  //     padding: EdgeInsets.all(15),
                  //     child: Image.asset(
                  //       "images/login.png",
                  //       height: 270,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 180,
                    width: double.infinity,
                  ),
                  Text(
                    'Login',
                    style: Styles.style36700,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: Styles.styleGray16,
                        ),
                        CustomTextField(
                          // data: Icons.email,
                          controller: emailController,
                          hintText: "Email",
                          isObsecre: false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Password',
                          style: Styles.styleGray16,
                        ),
                        CustomTextField(
                          // data: Icons.lock,
                          controller: passwordController,
                          hintText: "Password",
                          isObsecre: true,
                        ),
                      ],
                    ),
                  ),
                  // ElevatedButton(
                  //   child: const Text(
                  //     "Login",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.cyan,
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 50, vertical: 10),
                  //   ),
                  //   onPressed: () {
                  //     formValidation();
                  //   },
                  // ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: Text(
                      'Forgot password?',
                      style: Styles.styleOrange14500,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        formValidation();
                      },
                      child: Container(
                        height: 60,
                        width: 248,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          color: ColorUtil.orangeFE,
                        ),
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: Styles.styleWhite15700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: Styles.styleblack5B14500,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => const RegisterScreen()));
                        },
                        child: Text(
                          'Sign Up',
                          style: Styles.styleOrange14500,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
