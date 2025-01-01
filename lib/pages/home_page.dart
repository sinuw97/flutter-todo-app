import 'package:dhim_api/colors/app_colors.dart';
import 'package:dhim_api/widgets/calender_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Headers
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 189,
                decoration: const BoxDecoration(
                  color: AppColors.desertSand,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(50, 40)
                  )
                ),
                child: Column(
                  children: [
                    // Header Text
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10
                      ),
                      child: Text(
                        "My Todo App",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    ),
                    // Welcome Text
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 29
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
                                  margin: EdgeInsets.only(top: 10, left: 20),
                                  width: 50,
                                  height: 50,
                                  color: AppColors.whiteSmoke,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          // Date Picker
          Column(
            children: [
              CalendarAppBar()
            ],
          )
        ],
      )
    );
  }
}