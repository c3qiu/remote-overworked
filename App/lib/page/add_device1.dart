import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_overworked/router/app_pages.dart';
import 'dart:developer';

import 'home.dart';
import 'add_device2.dart';

String type = 'TV';

class Add_Device_1 extends StatelessWidget {
  const Add_Device_1({Key? key}) : super(key: key);

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
            Padding(
              // padding: EdgeInsets.all(10),
              padding: const EdgeInsets.only(top: 130.0, bottom: 10.0, left: 10.0, right: 10.0),
              child: ListView(
                children: <Widget>[
                  GridView.builder(
                    primary: true,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 30.0,
                      mainAxisExtent: 100,
                      childAspectRatio: 3/4,
                    ),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return _inkWell();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String device_type = '';
List<String> device_list = ['TV', 'AC', 'PROJECTOR', 'FAN', 'LIGHT BULB', 'MUSIC BOX', 'GAME CONTROLLER'];
int index = 0;
int count = device_list.length;

Card _device(){
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0)),
    child: Padding(
      padding: const EdgeInsets.all(11),
      child: _image(),
    ),
    color: Color.fromRGBO(255, 255, 255, 0.33),
  );
}

Image _image(){
  index = index % (count);
  // log(device_list[index]);
  if(device_list[index] == 'TV'){
    index = index + 1;
    return Image.asset(
      "img/icons8_tv_60px.png",
      height: 70,
    );
  }
  else if(device_list[index] == 'AC'){
    index = index + 1;
    return Image.asset(
      "img/icons8_air_conditioner_60px.png",
      height: 70,
    );
  }
  else if(device_list[index] == 'PROJECTOR'){
    index = index + 1;
    return Image.asset(
      "img/icons8_video_projector_52px.png",
      height: 70,
    );
  }
  else if(device_list[index] == 'FAN'){
    index = index + 1;
    return Image.asset(
      "img/icons8_fan_head_60px.png",
      height: 70,
    );
  }
  else if(device_list[index] == 'LIGHT BULB'){
    index = index + 1;
    return Image.asset(
      "img/icons8_idea_60px.png",
      height: 70,
    );
  }
  else if(device_list[index] == 'MUSIC BOX'){
    index = index + 1;
    return Image.asset(
      "img/icons8_portable_speaker_60px.png",
      height: 70,
    );
  }
  else if(device_list[index] == 'GAME CONTROLLER'){
    index = index + 1;
    return Image.asset(
      "img/icons8_game_controller_60px.png",
      height: 70,
    );
  }
  else{
    return Image.asset(
    "img/icons8_contacts_64px.png",
    height: 35,
    );
  }

}

Column _DeviceList(){
  final children = <Widget>[];
  children.add(_device());
  return Column(
    children: children,
  );
}

InkWell _inkWell(){
  // log('index: $index');
  if(index % (count) == 0){
    return InkWell(
      onTap: () => Get.to(() => Add_Device_2(),arguments: ['tv']),
      child: Center(
        child: _DeviceList(),
      ),
    );
  }
  else{
    return InkWell(
      onTap: () {},
      child: Center(
        child: _DeviceList(),
      ),
    );
  }
  // return InkWell(
  //   onTap: () {
  //
  //
  //   },
  //   child: Center(
  //     child: _DeviceList(),
  //   ),
  // );
}