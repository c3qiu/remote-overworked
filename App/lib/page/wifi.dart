import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'home.dart';
import 'add_device5.dart';

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
            // Return to HOME
            GestureDetector(
              onTap: () => Get.to(() => HomeView()),
              child: Container(
                height: 40.0,
                margin: const EdgeInsets.only(left:320.0, top:10.0, right: 5.0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  // shape: BoxShape.rectangle,
                ),
                child: Center(
                  child: Text(
                    'HOME',
                    style: TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
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
              margin: const EdgeInsets.only(top: 190.0,),
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
            // Info and image
            Container(
              margin: EdgeInsets.symmetric(vertical: 220.0, horizontal: 5.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.33),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'USERNAME: ',
                          style: TextStyle(

                            height: 3,
                            fontFamily: 'Righteous',
                            fontSize: 22.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'PASSWORD: ',
                          style: TextStyle(

                            height: 6,
                            fontFamily: 'Righteous',
                            fontSize: 22.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.0,
                            color: Colors.white,
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your username',
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          'USERNAME: ',
                          style: TextStyle(

                            height: 2.2,
                            fontFamily: 'Righteous',
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.0,
                            color: Colors.white,
                          ),
                        ),
                        Container(),
                      ],
                    ),
                    // Return to Home
                    GestureDetector(
                      onTap: () {
                        Get.to(() => HomeView());
                      },
                      child: Container(
                        height: 40.0,
                        margin: const EdgeInsets.only(left:320.0, top:10.0, right: 5.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                          // shape: BoxShape.rectangle,
                          ),
                        child: Center(
                          child: Text(
                          'CONNECT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Righteous',
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.0,
                            color: Colors.black,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}