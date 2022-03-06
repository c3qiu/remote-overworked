import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'home.dart';
import 'add_device6.dart';

class Add_Device_5 extends StatefulWidget {
  const Add_Device_5({Key? key}) : super(key: key);
  @override
  _Add_Device_5 createState() => _Add_Device_5();
}

class _Add_Device_5 extends State<Add_Device_5> {

  Color _colorSelect = Color.fromRGBO(255, 255, 255, 0.4);
  Color _colorNonSelect = Color.fromRGBO(255, 255, 255, 0.25);
  bool pressAttention1 = false;
  bool pressAttention2 = false;
  int index = 0;

  Future<int> getRequest(String d, String b, String m) async {
    //replace your restFull API here.
    String devicetype = d;
    String brand = b;
    String modeltype = m;

    final response = await http.get(Uri.parse('http://192.168.137.127/send?type=' + devicetype + '&brand=' + brand + '&model=' + modeltype + '&command=' + 'pwr'));
    return 0;
  }

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
            SizedBox(
              width: double.infinity,
              child: Text(
                'Press the Power Button',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 9.4,
                  fontFamily: 'Righteous',
                  fontSize: 23.0,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.0,
                  color: Color.fromRGBO(255, 255, 255, 1),
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
            // Info and image
            GestureDetector(
              onTap: () {
                getRequest(Get.arguments[0],Get.arguments[1], Get.arguments[2]);
              },
              child:Container(
                margin: EdgeInsets.symmetric(vertical: 250.0, horizontal: 40.0),
                height: 130,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.33),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    "img/icons8_shutdown_60px.png",
                    height: 100,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            //Description2
            SizedBox(
              width: double.infinity,
              child: Text(
                'Is the device turned on?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 26.0,
                  fontFamily: 'Righteous',
                  fontSize: 23.0,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.0,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            // YES button
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _row(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  GestureDetector _choiceButton(int n){
    return GestureDetector(
      onTap: () {
        if(n == 1){
          setState(() {
            pressAttention1 = true;
            pressAttention2 = false;
          });
        }
        else if(n == 0){
          setState(() {
            pressAttention1 = false;
            pressAttention2 = true;
          });
        }
        Get.to(() => Add_Device_6(),
            arguments: [Get.arguments[0], Get.arguments[1], Get.arguments[2], n]);
      },
      child: _choicesBox(),
    );
  }

  Color _stateColor(){
    if(num == 0) {
      return pressAttention1 ? _colorSelect : _colorNonSelect;
    }
    else if(num == 1) {
      return pressAttention2 ? _colorSelect : _colorNonSelect;
    }
    else{
      return _colorNonSelect;
    }
  }

  List<Widget> _row(){
    final children = <Widget>[];
    children.add(_choiceButton(1));
    children.add(_choiceButton(0));
    return children;
  }

  Container _choicesBox(){
    return Container(
      height: 54.0,
      width: 160,
      margin: const EdgeInsets.only(top: 420.0, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          color: _stateColor(),
          borderRadius: BorderRadius.all(Radius.circular(30))
        // shape: BoxShape.rectangle,
      ),
      child: Center(
        child: _text(),
      ),
    );
  }

  int num = 0;
  Text _text(){
    String t ='';
    if(num == 0){
      t = 'YES';
      num = 1;
    }
    else if (num == 1){
      t = 'NO';
      num = 0;
    }
    return Text(
      t,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Righteous',
        fontSize: 28.0,
        fontWeight: FontWeight.normal,
        letterSpacing: 1.0,
        color: Colors.white,
      ),
    );
  }
}