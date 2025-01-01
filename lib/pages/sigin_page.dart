import 'package:dhim_api/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sage,
      body: ListView(
        children: const [
          Center(
            child: Text("Ini Signin Page!"),
          )
        ],
      ),
    );
  }
}