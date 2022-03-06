import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'home.dart';

class Add_WiFi extends StatefulWidget {
  const Add_WiFi({Key? key}) : super(key: key);
  @override
  _Add_wifi createState() => _Add_wifi();
}

class _Add_wifi extends State<Add_WiFi> {

  bool pressAttention = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController wifiController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    // final details = Get.arguments;
    // log('brand: ${details[0]}');
    // log('model: ${details[1]}');

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Background
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.35,0.3),
                  end: Alignment(-0.15,-0.88),
                  colors: const <Color> [Color(0xff19424C),Color(0xff1E9370),Color(0xff052338)],
                ),
              ),
            ) ,
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Title
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'WELCOME BACK',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 4.0,
                            fontFamily: 'Righteous',
                            fontSize: 44.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.0,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                      //Description1
                      Container(
                        margin: const EdgeInsets.only(top: 5.0,),
                        width: double.infinity,
                        child: Text(
                          'Please enter wifi information below',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Righteous',
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.0,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.33),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              TextField(
                                controller: wifiController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.wifi),
                                  labelText: "Network Name",
                                  labelStyle: TextStyle(
                                    fontFamily: 'Righteous',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    fontFamily: 'Righteous',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              MaterialButton(
                                  height: 50.0,
                                  elevation: 5,
                                  minWidth: 200,
                                  onPressed: () {
                                    log(wifiController.text);
                                    log(passwordController.text);
                                    if(wifiController.text.isNotEmpty){
                                      Get.to(() => HomeView(),arguments: [wifiController.text, passwordController.text],);
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                  ),
                                  color: Color(0xFF3E6A6D),
                                  disabledColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.50),
                                  disabledElevation: 0,
                                  child: Text(
                                    'CONNECT',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Righteous',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => HomeView());
                                  },
                                  child: Text(
                                    "HOME",
                                    style: TextStyle(
                                      fontFamily: 'Righteous',
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      decorationThickness: 4,
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}