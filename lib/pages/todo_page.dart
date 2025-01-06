import 'package:dhim_api/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:dhim_api/colors/app_colors.dart';
import 'package:intl/intl.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();

  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay? startTime, endTime;

  // func untuk select time
  Future<Null> selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (pickedTime != null) {
      setState(() {
        startTime = pickedTime;
        final formattedHour = startTime?.hour.toString().padLeft(2, '0');
        final formattedMinute = startTime?.minute.toString().padLeft(2, '0');
        _startTimeController.text = "${formattedHour}:${formattedMinute}";
        print("Start Time: ${_startTimeController.text}");
        print("Start Time variable: ${startTime}");
      });
    }
  }

  // func untuk simpan ke database
  void _saveTask() {
    String title = _titleController.text;
    String description = _descriptionController.text;
    String dateTime = _dateController.text;
    String startTime = _startTimeController.text;
    String endTime = _endTimeController.text;

    print(title);
    print(description);
    print(dateTime);
    print(startTime);
    print(endTime);

    _titleController.clear();
    _descriptionController.clear();
    _dateController.clear();
    _startTimeController.clear();
    _endTimeController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task berhasil dibuat!')),
    );
  }

  // func untuk select time
  Future<Null> selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (pickedTime != null) {
      setState(() {
        endTime = pickedTime;
        final formattedHour = endTime?.hour.toString().padLeft(2, '0');
        final formattedMinute = endTime?.minute.toString().padLeft(2, '0');
        _endTimeController.text = "${formattedHour}:${formattedMinute}";
        print("End Time: ${_startTimeController.text}");
        print("End Time variable: ${endTime}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create new task",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            right: 30,
            left: 30
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Title",
                style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 5),
              // Title Field
              buildTitleField(),
              SizedBox(height: 5),
              // date & time
              Text(
                "Date & Time",
                style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 5),
              buildDateField(),
              SizedBox(height: 5),
              // Time sections
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Start time
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start Time",
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(
                        width: 130,
                        child: buildStartTimeField()),
                    ],
                  ),
                  // End time
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "End Time",
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(
                        width: 130,
                        child: buildEndTimeField()),
                    ],
                  )
                ],
              ),
              SizedBox(height: 5),
              // descriptions
              Text(
                "Descriptions",
                style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 5),
              buildDescriptionField(),
              SizedBox(height: 30),
              // Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // btn canvel
                  Container(
                    width: 108,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MainPage() ))
                        },
                      style: ElevatedButton.styleFrom(
                        //backgroundColor: AppColors.buff,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      )
                    )
                  ),
                  // btn create
                  Container(
                    width: 108,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () => {
                        _saveTask(),
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MainPage() ))
                        },
                      style: ElevatedButton.styleFrom(
                        //backgroundColor: AppColors.buff,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                      ),
                      child: const Text(
                        "Create",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      )
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  // widget title
  Widget buildTitleField() => TextField(
    controller: _titleController,
    style: const TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w600
    ),
    decoration: InputDecoration(
      hintText: "Your task title",
      labelStyle: const TextStyle(
        color: AppColors.black,
      ),
      contentPadding: const EdgeInsets.only(
        top: 3,
        left: 10
      ),
      // ignore: prefer_const_constructors
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.black,
          width: 2.0
        )
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black,  // Warna border saat focus
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black.withOpacity(0.6),  // Warna border saat dalam keadaan normal
          width: 2.0,
        ),
      ),
    ),
    textInputAction: TextInputAction.done,
  );

  // widget date & time
  Widget buildDateField() => TextField(
    controller: _dateController,
    readOnly: true,
    style: const TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w600
    ),
    decoration: InputDecoration(
      hintText: "Select Date",
      labelStyle: const TextStyle(
        color: AppColors.black,
      ),
      contentPadding: const EdgeInsets.only(
        top: 3,
        left: 10
      ),
      suffixIcon: Icon(Icons.calendar_month_rounded),
      // ignore: prefer_const_constructors
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.black,
          width: 2.0
        )
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black,  // Warna border saat focus
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black.withOpacity(0.6),  // Warna border saat dalam keadaan normal
          width: 2.0,
        ),
      ),
    ),
    onTap: () async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1999),
        lastDate: DateTime(2100),
      );
      // cek
      if(pickedDate != null) {
        // simpan kedalam state _date
        setState(() {
          _dateController.text = pickedDate.toLocal().toString().split(" ")[0];
        });
      }
    },
    textInputAction: TextInputAction.done,
  );

  // widget start time
  Widget buildStartTimeField() => TextField(
    controller: _startTimeController,
    readOnly: true,
    style: const TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w600
    ),
    decoration: InputDecoration(
      hintText: "00:00",
      suffixIcon: Icon(Icons.keyboard_arrow_down),
      labelStyle: const TextStyle(
        color: AppColors.black,
      ),
      contentPadding: const EdgeInsets.only(
        top: 3,
        left: 10
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.black,
          width: 2.0
        )
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black,  // Warna border saat focus
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black.withOpacity(0.6),  // Warna border saat dalam keadaan normal
          width: 2.0,
        ),
      ),
    ),
    onTap: (){
      selectStartTime(context);
    },
  );

  Widget buildEndTimeField() => TextField(
    controller: _endTimeController,
    readOnly: true,
    style: const TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w600
    ),
    decoration: InputDecoration(
      hintText: "00:00",
      suffixIcon: Icon(Icons.keyboard_arrow_down),
      labelStyle: const TextStyle(
        color: AppColors.black,
      ),
      contentPadding: const EdgeInsets.only(
        top: 3,
        left: 10
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.black,
          width: 2.0
        )
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black,  // Warna border saat focus
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black.withOpacity(0.6),  // Warna border saat dalam keadaan normal
          width: 2.0,
        ),
      ),
    ),
    onTap: (){
      selectEndTime(context);
    },
  );

  // widget descriptions
  Widget buildDescriptionField() => TextFormField(
    controller: _descriptionController,
    maxLines: 5,
    style: const TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w600
    ),
    decoration: InputDecoration(
      hintText: "Your task description goes here",
      labelStyle: const TextStyle(
        color: AppColors.black,
      ),
      contentPadding: const EdgeInsets.only(
        top: 9,
        left: 10
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.black,
          width: 2.0
        )
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black,  // Warna border saat focus
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black.withOpacity(0.6),  // Warna border saat dalam keadaan normal
          width: 2.0,
        ),
      ),
    ),
  );

}