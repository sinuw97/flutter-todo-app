import 'package:dhim_api/navigation/bottom_navbar.dart';
import 'package:dhim_api/pages/home_page.dart';
import 'package:dhim_api/pages/sigin_page.dart';
import 'package:flutter/material.dart';
import 'package:dhim_api/colors/app_colors.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  String password = '';
  bool isPasswordVisible = true;

 @override
  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sage,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text Welcome
            const Text(
              "Welcome New User!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.walnutBrown,
              ),
            ),
            const SizedBox(height: 20),
            // Box Login
            Container(
              width: 310,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.whiteSmoke,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.ashGrey.withOpacity(0.5), // Warna shadow
                    spreadRadius: 1, // Area penyebaran shadow
                    blurRadius: 10, // Kabur shadow
                    offset: Offset(4, 4), // Posisi shadow (x, y)
                  ),
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    // Email Field
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 275,
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Field
                              Expanded(
                                child: buildEmail()
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Password Field
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 275,
                          height: 67,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Field
                              Expanded(
                                child: buildPassword()
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Submit Button
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                print('Email: ${emailController.text}');
                                print('Password: ${password}');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const BottomNavbar())
                                );
                              }, 
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.sage,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30), // Sudut melengkung
                                ),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: AppColors.whiteSmoke,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            )
                          ),
                          const SizedBox(width: 30),
                          Container(
                            width: 100,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () => {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => const SigninPage()))
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.buff,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  // side: const BorderSide(
                                  //   color: AppColors.second,
                                  //   width: 1.5
                                  // )
                                )
                              ),
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                  color: AppColors.whiteSmoke,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  // ignore: prefer_const_constructors
  Widget buildEmail() => TextField(
    // ignore: prefer_const_constructors
    controller: emailController,
    style: const TextStyle(
        color: AppColors.resedaGreen,
        fontWeight: FontWeight.w600
    ),
    decoration: InputDecoration(
      hintText: "Enter Your Email",
      labelText: "Email",
      labelStyle: const TextStyle(
        color: AppColors.resedaGreen,
      ),
      prefixIcon: const Icon(
        Icons.email,
        color: AppColors.resedaGreen,
      ),
      suffixIcon: emailController.text.isEmpty
        ? Container(width: 0)
        : IconButton(
          color: AppColors.resedaGreen,
          icon: const Icon(Icons.close),
          onPressed: () => emailController.clear(),
        ),
      contentPadding: const EdgeInsets.only(
        top: 3,
        left: 4
      ),
      // ignore: prefer_const_constructors
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.resedaGreen,
          width: 2.0
        )
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.resedaGreen,  // Warna border saat focus
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.resedaGreen.withOpacity(0.6),  // Warna border saat dalam keadaan normal
          width: 2.0,
        ),
      ),
    ),
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.done,
  );

  Widget buildPassword() => TextField(
    onChanged: (value) => setState(() => this.password = value),
    onSubmitted: (value) => setState(() => this.password = value),

    style: const TextStyle(
      color: AppColors.resedaGreen,
      fontWeight: FontWeight.w600
    ),
    decoration: InputDecoration(
      hintText: "Enter Your Password",
      labelText: "Password",
      labelStyle: const TextStyle(
        color: AppColors.resedaGreen,
      ),
      suffixIcon: IconButton(
        color: AppColors.resedaGreen,
        icon: isPasswordVisible 
          ? Icon(Icons.visibility_off)
          : Icon(Icons.visibility), 
        onPressed: () => 
          setState(() => isPasswordVisible = !isPasswordVisible)
      ),
      contentPadding: const EdgeInsets.only(
        top: 3,
        left: 12),
      // ignore: prefer_const_constructors
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.resedaGreen,
          width: 2.0
        )
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.resedaGreen,  // Warna border saat focus
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.resedaGreen.withOpacity(0.6),  // Warna border saat dalam keadaan normal
          width: 2.0,
        ),
      ),
    ),
    obscureText: isPasswordVisible,
  );
}