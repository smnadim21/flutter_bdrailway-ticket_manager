import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_manager_flutter/add_ticket.dart';
import 'package:ticket_manager_flutter/controller/MyController.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyController myController = Get.put(MyController());
    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: Colors.grey.shade800,
                      ),
                      onPressed: () {
                        // menucontroller.signOut();
                      },
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.deepPurpleAccent])),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: CachedNetworkImage(
                        imageUrl: "image",
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/logo.png",
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  _buildRow(context, Icons.list_alt_rounded, "Add Account", "/add_account"),
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Train Ticket Manager'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(columns: [
            DataColumn(
              label: Text('Mobile'),
            ),
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text('Last Purchase'),
            ),
            DataColumn(
              label: Text('Journey Date'),
            ),
            DataColumn(
              label: Text('Quantity'),
            ),
            DataColumn(
              label: Text('Price'),
            ),
          ], rows: [
            DataRow(cells: [
              DataCell(Text('01943807008')),
              DataCell(Text('Nadim')),
              DataCell(Text('13-May-2021 07:49')),
              DataCell(Text('17-May-2021 07:49')),
              DataCell(Text('1')),
              DataCell(Text('65 BDT')),
            ]),
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Arshik')),
              DataCell(Text('5644645')),
              DataCell(Text('5644645')),
              DataCell(Text('3')),
              DataCell(Text('265\$')),
            ])
          ]),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to( AddTicketPage(title: "Add a Ticket")),
        //tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildRow(
      BuildContext context, IconData icon, String title, String? route,
      {bool showBadge = false, String badge = "0"}) {
    final TextStyle tStyle =
        TextStyle(color: Colors.grey.shade800, fontSize: 16.0);
    return OutlinedButton(
      onPressed: () {
        Navigator.pop(context);
        if (route != null) {
          //Navigator.pop(context);
          Get.back();
          Get.toNamed(route);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(children: [
          Icon(
            icon,
            color: Colors.grey.shade800,
          ),
          const SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
          const Spacer(),
          if (showBadge)
            Material(
              color: Colors.deepOrange,
              elevation: 5.0,
              shadowColor: Colors.red,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(

                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
        ]),
      ),
    );
  }
}
