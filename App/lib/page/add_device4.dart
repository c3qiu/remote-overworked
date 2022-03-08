import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_overworked/page/controller.dart';
import 'dart:developer';

import 'home.dart';
import 'add_device5.dart';

class Add_Device_4 extends StatefulWidget {
  const Add_Device_4({Key? key}) : super(key: key);
  @override
  _Add_Device_4 createState() => _Add_Device_4();
}

class _Add_Device_4 extends State<Add_Device_4> {

  Color _colorSelect = Color.fromRGBO(255, 255, 255, 0.4);
  Color _colorNonSelect = Color.fromRGBO(255, 255, 255, 0.25);
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
            ),
            // Return to Home
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
            Column(
              children: [
                // Title
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    ' ADD DEVICE:',
                    style: TextStyle(
                      height: 3.0,
                      fontFamily: 'Righteous',
                      fontSize: 40.0,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.0,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                //Description1
                SizedBox(
                  //left: 32.0,
                  child: Text(
                    'Please turn off your device...',
                    style: TextStyle(
                      height: 4.0,
                      fontFamily: 'Righteous',
                      fontSize: 22.0,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.0,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                //Empty box
                SizedBox(
                  height: 20.0,
                ),
                  // Info and image
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.33),
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Image.asset(
                          "img/icons8_tv_240px.png",
                          height: 280,
                        ),
                        Text(
                          '   OFF',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 2.55,
                            fontFamily: 'Righteous',
                            fontSize: 76.0,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Description2
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left:10.0, right: 10.0, top: 30.0),
                  child: Text(
                    'Once your decive is turned off Press Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: 22.0,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.0,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
                // NEXT button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pressAttention = true;
                    });
                    Get.to(() => Add_Device_5(), arguments: [Get.arguments[0], Get.arguments[1], Get.arguments[2]]);
                  },
                  child: Container(
                    height: 54.0,
                    margin: const EdgeInsets.only(left:110.0, right: 110.0, top: 30.0),
                    decoration: BoxDecoration(
                        color: pressAttention ? _colorSelect : _colorNonSelect,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      // shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                          fontFamily: 'Righteous',
                          fontSize: 28.0,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}