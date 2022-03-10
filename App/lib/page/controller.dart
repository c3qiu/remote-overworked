import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../device/device.dart';

int map_index = 1;
Map map = {};

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);
  @override
  Control_panel createState() => Control_panel();
}

class Control_panel extends State<Controller> {

  List<String> device_info = [];
  String device = '';
  String brand = '';
  String model = '';
  String mycommand = '';

  @override
  Future<int> getRequest(String command) async {
    //replace your restFull API here.
    final response = await http.get(Uri.parse('http://192.168.1.138/send?type=' + device +
        '&brand=' + brand + '&model=' + model + '&command=' + command));
    return 0;
  }

  @override
  Widget build(BuildContext context) {

    if(Get.arguments != null){
      List details = Get.arguments;
      // log('controller: ${details.length}');
      // log('$map');
      if(details.length == 2){
        if(map[details[1]] != null){
          device = map[details[1]][0].toString();
          brand = map[details[1]][1].toString();
          model = map[details[1]][2].toString();
          //log('already in file: $map');
        }
        else if(details[0].length == 3){
          // log('details');
          // List details = result;
          device = details[0][0].toString();
          brand = details[0][1].toString();
          model = details[0][2].toString();
          device_info.clear();
          device_info.add(device);
          device_info.add(brand);
          device_info.add(model);
          // log('$device_info');
          // map_index = result[1];
          map[map_index++] = device_info;
          details.clear();
          //log('not in file: $map');
        }
      }
    }
    // final details = Get.arguments;

    // log('device: ${details[0]}');
    // log('brand: ${details[1]}');
    // log('model: ${details[2]}');

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
            // Title
            Text(
              ' MY ' + device.toUpperCase() + ':',
              style: TextStyle(
                height: 3.0,
                fontFamily: 'Righteous',
                fontSize: 40.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.0,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            //Control panel
            _display(device),
          ],
        ),
      ),
    );
  }

  //TV panel
  Stack _tv(){
    return Stack(
        children: <Widget>[
          // Return to Home
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 55.0,
              margin: const EdgeInsets.only(left:320.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.65),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  "img/icons8_tv_60px.png",
                  height: 35,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 100.0),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.33),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          // --------------------
          // Power Button
          GestureDetector(
            onTap: () {
              print('Power ON/OFF');
              mycommand = 'pwr';
              getRequest(mycommand);
            },
            child: Container(
              height: 47.0,
              width: 47.0,
              margin: const EdgeInsets.only(left: 20,top: 120.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.33),
                shape: BoxShape.circle,
              ),
              child: Center(
                child:Icon(
                  Icons.power_settings_new,
                  color: Color(0xFF5B5B5B),
                  size: 32.0,
                ),
              ),
            ),
          ),
          // --------------------
          // Volume Up Button
          GestureDetector(
            onTap: () {
              print('Volume Up');
              mycommand = 'vu';
              getRequest(mycommand);
            },
            child: Container(
              height: 62.0,
              width: 62.0,
              margin: const EdgeInsets.only(left:78, top:450),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.33),
                shape: BoxShape.circle,
              ),
              child: Center(
                child:Icon(
                  Icons.volume_up,
                  color: Color(0xFF5B5B5B),
                  size: 49.0,
                ),
              ),
            ),
          ),
          // --------------------
          // Volume Down Button
          GestureDetector(
            onTap: () {
              print('Volume Down');
              mycommand = 'vd';
              getRequest(mycommand);
            },
            child: Container(
              height: 62.0,
              width: 62.0,
              margin: const EdgeInsets.only(left: 242, top:450),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.33),
                shape: BoxShape.circle,
              ),
              child: Center(
                child:Icon(
                  Icons.volume_down,
                  color: Color(0xFF5B5B5B),
                  size: 49.0,
                ),
              ),
            ),
          ),
          // --------------------
          // Setting Button
          GestureDetector(
            onTap: () {
              print('Setting');
              mycommand = 'stgs';
              getRequest(mycommand);
            },
            child: Container(
              height: 47.0,
              width: 47.0,
              margin: const EdgeInsets.only(left: 48, top:550),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.33),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.settings,
                  color: Color(0xFF5B5B5B),
                  size: 35.0,
                ),
              ),
            ),
          ),
          // --------------------
          // Return Button
          GestureDetector(
            onTap: () {
              print('Return');
              mycommand = 'bck';
              getRequest(mycommand);
            },
            child: Container(
              height: 47.0,
              width: 47.0,
              margin: const EdgeInsets.only(left: 282, top:550),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.33),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.keyboard_return,
                  color: Color(0xFF5B5B5B),
                  size: 35.0,
                ),
              ),
            ),
          ),
          // --------------------
          // input Button
          GestureDetector(
            onTap: () {
              print('input');
              mycommand = 'src';
              getRequest(mycommand);
            },
            child: Container(
              height: 35.0,
              width: 90,
              margin: const EdgeInsets.only(left: 146, top:555),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.33),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'input',
                  style: TextStyle(
                    height: 1.0,
                    fontFamily: 'Righteous',
                    fontSize: 24.0,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1.0,
                    color: Color(0xFF5B5B5B),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 230.0,
            margin: const EdgeInsets.only(left: 0, top:180),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.33),
              shape: BoxShape.circle,
            ),
          ),
          // --------------------
          // OK Button
          GestureDetector(
            onTap: () {
              print('OK');
              mycommand = 'ok';
              getRequest(mycommand);
            },
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(left: 0, top:235),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.33),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  'OK',
                  style: TextStyle(
                    height: 1.0,
                    fontFamily: 'Righteous',
                    fontSize: 64.0,
                    fontWeight: FontWeight.w100,
                    letterSpacing: 0.5,
                    color: Color(0xFF5B5B5B),
                  ),
                ),
              ),
            ),
          ),
          // --------------------
          // Up Button
          GestureDetector(
            onTap: () {
              print('Up');
              mycommand = 'up';
              getRequest(mycommand);
            },
            child: Container(
              height: 24.0,
              margin: const EdgeInsets.only(left: 0, top:196.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // --------------------
          // Down Button
          GestureDetector(
            onTap: () {
              print('Down');
              mycommand = 'dwn';
              getRequest(mycommand);
            },
            child: Container(
              height: 24.0,
              margin: const EdgeInsets.only(left: 0, top:370),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // --------------------
          // Left Button
          GestureDetector(
            onTap: () {
              print('Left');
              mycommand = 'lft';
              getRequest(mycommand);
            },
            child: Container(
              height: 24.0,
              width: 24.0,
              margin: const EdgeInsets.only(left: 92, top:282),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // --------------------
          // Right Button
          GestureDetector(
            onTap: () {
              print('Right');
              mycommand = 'rht';
              getRequest(mycommand);
            },
            child: Container(
              height: 24.0,
              margin: const EdgeInsets.only(left: 172, top:282),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ]
    );
  }

  //speaker panel
  Stack _spkr(){
    return Stack(
     children: <Widget>[
       // Return to Home
       GestureDetector(
         onTap: () => Get.back(),
         child: Container(
           height: 55.0,
           margin: const EdgeInsets.only(left:320.0),
           decoration: BoxDecoration(
             color: Color.fromRGBO(255, 255, 255, 0.65),
             shape: BoxShape.circle,
           ),
           child: Center(
             child: Image.asset(
               "img/icons8_portable_speaker_60px.png",
               height: 35,
             ),
           ),
         ),
       ),
       Container(
         margin: const EdgeInsets.only(top: 100.0),
         width: double.infinity,
         height: double.infinity,
         decoration: BoxDecoration(
           color: Color.fromRGBO(255, 255, 255, 0.33),
           borderRadius: BorderRadius.circular(40),
         ),
       ),
       // --------------------
      Column(
        mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
        crossAxisAlignment: CrossAxisAlignment.center,//Center Column contents horizontally,
        children: [
          SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  print('Volume Up');
                  mycommand = 'vu';
                  getRequest(mycommand);
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  // margin: const EdgeInsets.only(left: 242, top:450),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.33),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child:Icon(
                      Icons.volume_up,
                      color: Color(0xFF5B5B5B),
                      size: 50.0,
                    ),
                  ),
                ),
              ),
              // --------------------
              SizedBox(
                width: 50.0,
              ),
              // Volume Down Button
              GestureDetector(
                onTap: () {
                  print('Volume Down');
                  mycommand = 'vd';
                  getRequest(mycommand);
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  // margin: const EdgeInsets.only(left: 242, top:450),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.33),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child:Icon(
                      Icons.volume_down,
                      color: Color(0xFF5B5B5B),
                      size: 50.0,
                    ),
                  ),
                ),
              ),
              // --------------------
              SizedBox(
                width: 50.0,
              ),
              // Mute Button
              GestureDetector(
                onTap: () {
                  print('Mute');
                  mycommand = 'mt';
                  getRequest(mycommand);
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  //margin: const EdgeInsets.only(left: 242, top:450),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.33),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      "img/icons8_mute_52px.png",
                      height: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // PREV Button
              GestureDetector(
                onTap: () {
                  print('PREV');
                  mycommand = 'pre';
                  getRequest(mycommand);
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  //margin: const EdgeInsets.only(left: 242, top:450),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.33),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      "img/icons8_skip_to_start_48px_2.png",
                      height: 40,
                    ),
                  ),
                ),
              ),
              // --------------------
              SizedBox(
                width: 50.0,
              ),
              // Pause and Play Button
              GestureDetector(
                onTap: () {
                  print('Pause/Play');
                  mycommand = 'p';
                  getRequest(mycommand);
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  // margin: const EdgeInsets.only(left: 242, top:450),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.33),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      "img/icons8_resume_button_60px.png",
                      height: 50.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              // NEXT Button
              GestureDetector(
                onTap: () {
                  print('NEXT');
                  mycommand = 'nxt';
                  getRequest(mycommand);
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  //margin: const EdgeInsets.only(left: 242, top:450),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.33),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      "img/icons8_end_48px.png",
                      height: 40,
                    ),
                  ),
                ),
              ),
              // --------------------
            ],
          ),
          SizedBox(
            height: 100.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --------------------
              // MODE/SOUND EFFECT Button
              GestureDetector(
                onTap: () {
                  print('Sound Effect');
                  mycommand = 'eq';
                  getRequest(mycommand);
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  //margin: const EdgeInsets.only(left: 242, top:450),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.33),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      "img/icons8_music_52px.png",
                      height: 40,
                    ),
                  ),
                ),
              ),
              // --------------------
              SizedBox(
                width: 50.0,
              ),
              // input/USB，TF， FM Button
              GestureDetector(
                onTap: () {
                  print('input');
                  mycommand = 'md';
                  getRequest(mycommand);
                },
                child: Container(
                  height: 62.0,
                  width: 90,
                  //margin: const EdgeInsets.only(left: 146, top:555),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.33),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'input',
                      style: TextStyle(
                        height: 1.0,
                        fontFamily: 'Righteous',
                        fontSize: 26.0,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1.0,
                        color: Color(0xFF5B5B5B),
                      ),
                    ),
                  ),
                ),
              ),

              // --------------------
              SizedBox(
                width: 50.0,
              ),
              // Return Button
              GestureDetector(
                onTap: () {
                  print('Return');
                  mycommand = 'bck';
                  getRequest(mycommand);
                },
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  //margin: const EdgeInsets.only(left: 242, top:450),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.33),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.keyboard_return,
                      color: Color(0xFF5B5B5B),
                      size: 50.0,
                    ),
                  ),
                ),
              ),
              ],
          ),
        ],
      ),
        ]
    );
  }

  // Controller Box
  Padding _display(String type){
    //if type is speaker
    if(type == 'spkr'){
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 5.0),
        child: _spkr(),
      );
    }
    //else dispaly default panel
    else{
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 5.0),
        child: _tv(),
      );
    }
  }

}