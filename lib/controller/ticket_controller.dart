import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_manager_flutter/database/entity.dart';

import '../database/ticket_database.dart';

class TicketController extends GetxController {
  List<TicketAccount> tiketAccount = <TicketAccount>[].obs;
  var emailTextController = TextEditingController().obs;
  var passWordController = TextEditingController().obs;
  var forgotPassWordController =
      TextEditingController(text: 'Forgot Password').obs;

  final selectedValue = Rxn<TicketAccount>();
  final selectedQuantity = Rxn<int>();

  @override
  void onInit() {
    getAllAccounts();
    super.onInit();
  }

  Future<void> getAllAccounts() async {
    var db = await LocalDB.initDb();
    var abc = await db.localDao.getAllAccounts();
    tiketAccount.addAll(abc);
  }
}
