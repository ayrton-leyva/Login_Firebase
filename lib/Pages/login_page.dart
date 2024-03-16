import 'package:login_firebase/Components/my_button.dart';
import 'package:login_firebase/Components/my_textfield.dart';
import 'package:login_firebase/Components/space_between_columns.dart';
import 'package:login_firebase/Components/space_between_rows.dart';
import 'package:login_firebase/Components/square_tiles.dart';
import 'package:login_firebase/Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/auth";
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final MaterialColor materialColor = Colors.grey;

  // Sign in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email');
      } else if (e.code == 'wrong-password') {
        print('Wrong password buddy');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: materialColor[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SpaceBetweenRows(),

                // Logo
                const Icon(
                  Icons.search,
                  size: 135,
                ),

                SpaceBetweenRows(),

                // Wwlcome back

                Text(
                  'Log In',
                  style: TextStyle(color: materialColor[700], fontSize: 17),
                ),

                SpaceBetweenRows.half(),

                // email TextField
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  materialColor: materialColor,
                ),

                SpaceBetweenRows.half(),

                // password TextField
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  materialColor: materialColor,
                ),

                SpaceBetweenRows.quarter(),

                // forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: materialColor[600]),
                      )
                    ],
                  ),
                ),

                SpaceBetweenRows.half(),

                // SignIn button
                MyButton(
                  text: 'Sign In',
                  onTap: signUserIn,
                ),

                SpaceBetweenRows(),

                // continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: materialColor[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or Sign In with',
                          style: TextStyle(
                            color: materialColor[700],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: materialColor[400],
                        ),
                      ),
                    ],
                  ),
                ),

                SpaceBetweenRows(),

                // access buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google
                    SquareTiles(
                      imagePath: 'assets/logos/google.png',
                      materialColor: materialColor,
                      onTap: () => AuthService().signInWithGoogle(),
                    ),

                    SpaceBetweenColumns.half(),

                    // Facebook
                    SquareTiles(
                      imagePath: 'assets/logos/facebook.png',
                      materialColor: materialColor,
                      onTap: () => AuthService().signInWithGoogle(),
                    ),

                    SpaceBetweenColumns.half(),

                    // Github
                    SquareTiles(
                      imagePath: 'assets/logos/github.png',
                      materialColor: materialColor,
                      onTap: () => AuthService().signInWithGoogle(),
                    ),
                  ],
                ),

                SpaceBetweenRows(),

                SpaceBetweenRows.half(),

                // register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: materialColor[700],
                      ),
                    ),
                    SpaceBetweenColumns.quarter(),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
