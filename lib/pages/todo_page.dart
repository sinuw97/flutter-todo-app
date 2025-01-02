import 'package:dhim_api/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:dhim_api/colors/app_colors.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
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
              // start time
              Text(
                "Start Time",
                style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 5),
              buildStartTimeField(),
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

  // widget title
  Widget buildTitleField() => TextField(
    //controller: emailController,
    style: const TextStyle(
      color: AppColors.resedaGreen,
      fontWeight: FontWeight.w600
    ),
    decoration: InputDecoration(
      hintText: "Your task title",
      labelStyle: const TextStyle(
        color: AppColors.resedaGreen,
      ),
      contentPadding: const EdgeInsets.only(
        top: 3,
        left: 10
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
    textInputAction: TextInputAction.done,
  );

  // widget date & time
  Widget buildDateField() => TextField(
    //controller: emailController,
    style: const TextStyle(
      color: AppColors.resedaGreen,
      fontWeight: FontWeight.w600
    ),
    decoration: InputDecoration(
      hintText: "Date & Time",
      labelStyle: const TextStyle(
        color: AppColors.resedaGreen,
      ),
      contentPadding: const EdgeInsets.only(
        top: 3,
        left: 10
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
    textInputAction: TextInputAction.done,
  );

  // widget start time
  Widget buildStartTimeField() => TextField(
    style: const TextStyle(
      color: AppColors.resedaGreen,
      fontWeight: FontWeight.w600
    ),
    decoration: InputDecoration(
      hintText: "00:00",
      labelStyle: const TextStyle(
        color: AppColors.resedaGreen,
      ),
      contentPadding: const EdgeInsets.only(
        top: 3,
        left: 10
      ),
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
  );

  // widget descriptions
  Widget buildDescriptionField() => TextFormField(
    maxLines: 5,
    style: const TextStyle(
      color: AppColors.resedaGreen,
      fontWeight: FontWeight.w600
    ),
    decoration: InputDecoration(
      hintText: "Your task description goes here",
      labelStyle: const TextStyle(
        color: AppColors.resedaGreen,
      ),
      contentPadding: const EdgeInsets.only(
        top: 9,
        left: 10
      ),
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
  );
}