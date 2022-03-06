import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'home.dart';
import 'add_device3.dart';

class Add_Device_2 extends StatefulWidget {
  const Add_Device_2({Key? key}) : super(key: key);
  @override
  _Add_Device_2 createState() => _Add_Device_2();
}

class _Add_Device_2 extends State<Add_Device_2> {

  Color _colorSelect = Color.fromRGBO(255, 255, 255, 0.4);
  Color _colorNonSelect = Color.fromRGBO(255, 255, 255, 0.25);
  bool pressAttention1 = false;
  bool pressAttention2 = false;
  List<String> brand = ['Samsung', 'LG', 'Sony', 'JVC', 'NEC', 'MagiQuest'];
  int index = 0;

  @override
  Widget build(BuildContext context) {
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
            //Description
            SizedBox(
              width: double.infinity,
              child: Text(
                'Select your TV brand...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 8.0,
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
              onTap: () => Get.to(HomeView()),
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
            // Info
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 150.0),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.33),
                      // image: const DecorationImage(
                      //   image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                      //   fit: BoxFit.cover,
                      // ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      // empty box
                      Container(
                        width: double.infinity,
                        height: 73,
                        margin: const EdgeInsets.only(top: 130.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color.fromRGBO(255, 255, 255, 0.0),
                        ),
                      ),
                      // Brand Name
                      _brandSelect(),
                      _brandSelect(),
                      _brandSelect(),
                      _brandSelect(),
                      _brandSelect(),
                      _brandSelect(),
                    ],
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
  Ink _brandSelect(){
    if(index % brand.length == 0){
      return Ink(
        child: InkWell(
          child: _card(),
          onTap: () {
            // log('brand selector');
            setState(() {
              pressAttention1 = !pressAttention1;
              pressAttention2 = false;
            });
            Get.to(
              () => Model_Select_info(),
              //brand name pass in value
              arguments: [Get.arguments[0],'ss'],
            );
          }
        ),
      );
    }
    else if(index % brand.length == 1){
      return Ink(
        child: InkWell(
          child: _card(),
          onTap: () {
            // log('brand selector');
            setState(() {
              pressAttention1 = false;
              pressAttention2 = !pressAttention2;
            });
            Get.to(
              () => Model_Select_info(),
              //brand name pass in value
              arguments: [Get.arguments[0],'lg'],
            );
          }
        ),
      );
    }
    else{
      return Ink(
        child: InkWell(
          child: _card(),
          onTap: () {
            log('brand not selected');
            setState(() {
              pressAttention1 = false;
              pressAttention2 = false;
            });
          }
        ),
      );
    }
  }

  Text _brandName(){
    String t = '';
    index = index % brand.length;
    t = brand[index];
    index = index + 1;
    return Text(
      t,
      style: TextStyle(
        fontFamily: 'Righteous',
        fontSize: 36.0,
        fontWeight: FontWeight.normal,
        letterSpacing: 1.0,
        color: Color(0xff5b5b5b),
      ),
    );
  }

  Color _stateColor(){
    if(index % brand.length == 0) {
      return pressAttention1 ? _colorSelect : _colorNonSelect;
    }
    else if(index % brand.length == 1) {
      return pressAttention2 ? _colorSelect : _colorNonSelect;
    }
    else{
      return _colorNonSelect;
    }
  }

  Container _card(){
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _stateColor(),
        border: Border.all(
          color: Color(0xFF738D91),
          width: 1,
        ),
      ),
      child: Center(child: _brandName(),),
    );
  }
}
