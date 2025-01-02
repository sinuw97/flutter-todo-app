import 'package:dhim_api/colors/app_colors.dart';
import 'package:dhim_api/widgets/calender_bar.dart';
import 'package:dhim_api/widgets/today_task.dart';
import 'package:flutter/material.dart';
import 'package:dhim_api/widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final tasks = [
    {
      "time": "10:20 am",
      "title": "Meeting with client",
      "subtitle": "At local cafe"
    },
    {
      "time": "12:15 pm",
      "title": "Lunch",
      "subtitle": "Restaurant"
    },
    {
      "time": "02:00 pm",
      "title": "Finish app design",
      "subtitle": "4/5 Screen"
    },
    {
      "time": "02:00 pm",
      "title": "Finish app design",
      "subtitle": "4/5 Screen"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          // Headers
          Stack(
            children: [
              HomeHeader()
            ],
          ),
          SizedBox(height: 20),
          // Date Picker
          Column(
            children: [
              CalendarAppBar()
            ],
          ),
          SizedBox(height: 20),
          // Today's task
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              child: Column(
                children: [
                  // Task Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today's Task",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  // List Tile
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(), // Disable scroll biar ikut scroll utama
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      //
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.gray3,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: ListTile(
                            leading: Checkbox(
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task['time']!,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                    color: AppColors.black.withOpacity(0.6),
                                  ),
                                ),
                                Text(
                                  task["title"]!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              task["subtitle"]!,
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.5),
                              ),
                            ),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}