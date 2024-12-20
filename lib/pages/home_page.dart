import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(
          child: Text('RESTFul API')),
          elevation: 50,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
         final user = users[index];
         return ListTile(
          leading: Text('${index + 1}'),
          title: Text(user["name"]),
          subtitle: Text(user["username"]),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
        backgroundColor: Colors.amber,
        shape: CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void fetchUsers() async{
    print("Clicked");
    // url endpoint
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    // await the http to fetch data
    final response = await http.get(url);
    // get the response body
    final body = jsonDecode(response.body);
    setState(() {
      users = body;
    });
    print(users);
    print(users.length);
    print("Completed");
  }
}