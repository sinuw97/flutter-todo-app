import 'package:flutter/material.dart';
import 'package:dhim_api/colors/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 189,
      decoration: const BoxDecoration(
        color: AppColors.gray8,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(50, 40)
        )
      ),
      child: Column(
        children: [
           // Welcome Text
          Padding(
            padding: const EdgeInsets.only(
              top: 70
            ),
            child: SizedBox(
              width: 319,
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 // Greetings & Date
                  Container(
                    width: 249,
                    height: 120,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello User !",
                            style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          "Monday, 1 Jan 2025",
                          style: TextStyle(
                          fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                  ),
                   // Image Profile
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 5),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.gray6,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}