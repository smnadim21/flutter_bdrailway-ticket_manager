import 'package:flutter/material.dart';
import 'package:ticket_manager_flutter/home.dart';

class AddTicketPage extends StatefulWidget {
  const AddTicketPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AddTicketPage> createState() => _AddTicketPageState();
}

class _AddTicketPageState extends State<AddTicketPage> {
  late TextEditingController emailTextController,
      passWordController,
      forgotPassWordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailTextController = TextEditingController();
    passWordController = TextEditingController();
    forgotPassWordController = TextEditingController(text: 'Forgot Password');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add new Ticket"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                  child: const Text(
                    "Login Page",
                    textAlign: TextAlign.center,
                  ), //Image.asset('asset/images/flutter-logo.png')
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailTextController,
                /*onChanged: (s) {
                  setState(() {
                    forgotPassWordController.text = s;
                  });
                },*/
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passWordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            TextButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                forgotPassWordController.text,
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  if (emailTextController.text == 'nadim') {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Home()));
                  } else {
                    setState(() {
                      forgotPassWordController.text =
                          emailTextController.text + " is not correct";
                    });
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}
