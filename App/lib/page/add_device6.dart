import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'home.dart';

class Add_Device_6 extends StatefulWidget {
  const Add_Device_6({Key? key}) : super(key: key);
  @override
  _Add_Device_6 createState() => _Add_Device_6();
}

class _Add_Device_6 extends State<Add_Device_6> {

  Color _colorSelect = Color.fromRGBO(255, 255, 255, 0.4);
  Color _colorNonSelect = Color.fromRGBO(255, 255, 255, 0.25);
  bool pressAttention = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {

    // final details = Get.arguments;
    //
    // log('device: ${details[0]}');
    // log('brand: ${details[1]}');
    // log('model: ${details[2]}');
    // log('success: ${details[3]}');

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
            // Title
            Text(
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
            //Description1
            Container(
              margin: const EdgeInsets.only(top:130.0, left: 10.0, right: 10.0),
              width: double.infinity,
              child: _info(),
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
            // Info and image
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.33),
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "img/icons8_tv_240px.png",
                      height: 250,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      top: 45.0,
                      child: _image(),
                    ),
                  ],
                ),
              ),
            ),
            // Return back to home button
            GestureDetector(
              onTap: () {
                setState(() {
                  pressAttention = true;
                });
                Get.to(() => HomeView(),
                    arguments: [Get.arguments[0], Get.arguments[1], Get.arguments[2], Get.arguments[3]]);
              },
              child: Container(
                height: 54.0,
                margin: const EdgeInsets.only(left:30, right: 30, top: 570.0),
                decoration: BoxDecoration(
                    color: pressAttention ? _colorSelect : _colorNonSelect,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  // shape: BoxShape.rectangle,
                ),
                child: Center(
                  child: Text(
                    'BACK TO HOME PAGE',
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
      ),
    );
  }

  int num = Get.arguments[3];
  Text _info(){
    String t = '';
    if(num == 1){
      t = 'Remote Control is now Ready to use!';
    }
    else if(num == 0){
      t = 'Device not Found.';
    }
    return Text(
      t,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Righteous',
        fontSize: 23.0,
        fontWeight: FontWeight.normal,
        letterSpacing: 1.0,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
    );
  }

  Image _image(){
    var a = Image.asset(''); // type Image

    if(num == 1){
      a = Image.asset(
        "img/icons8_happy_64px.png",
        height: 130,
        fit: BoxFit.fitWidth,
      );
    }
    else if(num == 0){
      a = Image.asset(
        "img/icons8_sad_64px.png",
        height: 130,
        fit: BoxFit.fitWidth,
      );
    }
    return a;
  }
}