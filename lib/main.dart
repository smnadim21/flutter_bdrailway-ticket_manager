import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_manager_flutter/add_account.dart';
import 'package:ticket_manager_flutter/add_ticket.dart';
import 'package:ticket_manager_flutter/database/ticket_database.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(
            name: '/add_ticket',
            page: () => const AddTicketPage(title: "title")),
        GetPage(
            name: '/add_account',
            page: () => const AddAccountPage(title: "Add new account")),
      ],
    );
  }
}
