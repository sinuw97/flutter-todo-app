import 'package:dhim_api/colors/app_colors.dart';
import 'package:flutter/material.dart';

class TodayTask extends StatefulWidget {
  const TodayTask({super.key});

  @override
  State<TodayTask> createState() => _TodayTaskState();
}

class _TodayTaskState extends State<TodayTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // container 1
          Container(
            width: 200,
            height: 52,
            color:AppColors.gray3,
          )
        ],
      ),
    );
  }
}