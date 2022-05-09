import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_manager_flutter/database/entity.dart';

import 'controller/ticket_controller.dart';
import 'home.dart';

class AddTicketPage extends StatelessWidget {
  AddTicketPage({Key? key, required this.title}) : super(key: key);
  final String title;
  TicketController ticketController = Get.put(TicketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add new Ticket"),
      ),
      body: SingleChildScrollView(
        child: Obx(() => Column(
              children: <Widget>[
                Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: const EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 15),
                    child: Obx(
                      () => DropdownButton<TicketAccount>(
                        hint: Text("Select Account"),
                        value: ticketController.selectedValue.value,
                        items: ticketController.tiketAccount
                            .map((TicketAccount value) {
                          return DropdownMenuItem<TicketAccount>(
                            value: value,
                            child: Text(value.mobile),
                          );
                        }).toList(),
                        onChanged: (changedValue) {
                          print(changedValue?.mobile);
                          ticketController.selectedValue.value = changedValue;
                        },
                      ),
                    )),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: ticketController.emailTextController.value,
                    /*onChanged: (s) {
                  setState(() {
                    forgotPassWordController.text = s;
                  });
                },*/
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last Purchase',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: ticketController.passWordController.value,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Journey Date',
                        hintText: 'Enter secure password'),
                  ),
                ),
                Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: const EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 15),
                    child: Obx(
                      () => DropdownButton<int>(
                        hint: Text("Select Quantity"),
                        value: ticketController.selectedQuantity.value,
                        items: <int>[1, 2, 3, 4].map((value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                             "QTY : "+ value.toString(),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }).toList(),
                        onChanged: (changedValue) {
                          ticketController.selectedQuantity.value =
                              changedValue;
                        },
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: ticketController.passWordController.value,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Price',
                        hintText: 'Enter price'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: Text(
                    ticketController.forgotPassWordController.value.text,
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    onPressed: () {
                      if (ticketController.emailTextController.value.text ==
                          'nadim') {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Home()));
                      } else {
                        ticketController.forgotPassWordController.value.text =
                            ticketController.emailTextController.value.text +
                                " is not correct";
                      }
                    },
                    child: const Text(
                      'Save Ticket',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
                Text('New User? Create Account')
              ],
            )),
      ),
    );
  }
}
