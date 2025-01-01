import 'package:dhim_api/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CalendarAppBar extends StatefulWidget {
  const CalendarAppBar({super.key});

  @override
  State<CalendarAppBar> createState() => _CalendarAppBarState();
}

class _CalendarAppBarState extends State<CalendarAppBar> {
  // ambil waktu sekarang
  DateTime currentDate = DateTime.now();
  DateTime? selectedDate;
  // buat List untuk nampilin 7 hari
  List<DateTime> generateWeek(DateTime date) {
    // ambil tanggal minggu ini
    int currentDay = date.weekday;
    DateTime firstDayofWeek = date.subtract(Duration(days: currentDay - 1));
    return List.generate(7, (index) => firstDayofWeek.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> weekDays = generateWeek(currentDate);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // arrow back btn
            IconButton(
              onPressed: () {
                setState(() {
                  currentDate = currentDate.subtract(Duration(days: 7));
                  selectedDate = null;
                });
              },
              icon: Icon(Icons.arrow_back),
            ),
            // Menampilkan tahun
            Text(
              DateFormat('y').format(currentDate),
              style: TextStyle(
                fontSize: 17
              ),
            ),
            // Arrow forward btn
            IconButton(
              onPressed: () {
                setState(() {
                  currentDate = currentDate.add(Duration(days: 7));
                  selectedDate = null;
                });
              },
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weekDays.length,
            itemBuilder: (context, index) {
              DateTime day = weekDays[index];
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedDate = day;
                  });
                },
                child: Container(
                  width: 60,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: selectedDate == day
                      ? AppColors.sage
                      : (currentDate.weekday == day.weekday
                        ? AppColors.desertSand
                        : AppColors.whiteSmoke),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Hari
                      Text(
                        DateFormat('E').format(day),
                        style: TextStyle(
                          fontSize: 11
                        ),
                      ),
                      // Tangal
                      Text(
                        DateFormat('d').format(day),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        DateFormat('MMM').format(day),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  )
                ),
              );
            },
          ),
        )
      ],
    );
  }
}