// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
// import '../device/device.dart';
import 'controller.dart';
import 'add_device1.dart';

int index = 0;
int c = 0;
int map_index = 5;
List<String> device_info = [];
Map map = {};

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Home createState() => Home();
}

class Home extends State<HomeView> {
  List<String> type = ['TV','PROJECTOR','AC','LIGHT BULB'];
  String data = '';
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if(Get.arguments != null){
      List result = Get.arguments;
      if(result.length == 4){
        log('$result');
        if(result[3] == 1){
          type.add(result[0].toString().toUpperCase());

          device_info.add(result[0]);
          device_info.add(result[1]);
          device_info.add(result[2]);
          if(device_info.length == 3) {
            map[map_index] = device_info;
            map_index = map_index + 1;
          }
          index = 0;
          c = 0;
        }
        else if(result[3] == 0) {
            index = 0;
            c = 0;
        }
      }
      result.clear();
    }
    log('$type');
    log('$device_info');
    // log('${Get.arguments}');
    log('$map');

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
              ' MY HOME:',
              style: TextStyle(
                height: 3.0,
                fontFamily: 'Righteous',
                fontSize: 40.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.0,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
            // trash icon
            Positioned(
              top:15.0,
              left:355.0,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
            // Device list
            Padding(
              // padding: EdgeInsets.all(10),
              padding: const EdgeInsets.only(top: 140.0, bottom: 40.0, left: 10.0, right: 10.0),
              child: ListView(
                children: <Widget>[
                  GridView.builder(
                    primary: true,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 30.0,
                      mainAxisExtent: 100,
                      childAspectRatio: 3/4,
                    ),
                    itemCount: _ItemCount() + 1,
                    itemBuilder: (context, index) {
                      c++;
                      return _ButtonBuilder();
                    },
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  int _ItemCount(){
    count = type.length;
    return count;
  }

  String _Type(){
    String t = '';
    //log('$type');
    index = index % count;
    //log('$index');
    if(type[index] == 'TV'){
      t = 'TV';
    }
    else if(type[index] == 'AC'){
      t = 'AC';
    }
    else if(type[index] == 'PROJECTOR'){
      t = 'PROJECTOR';
    }
    else if(type[index] == 'LIGHT BULB'){
      t = 'LIGHT BULB';
    }
    index = index + 1;
    // data = t;
    return t;
  }

  Image _icon(){
    if(data == 'TV'){
      return Image.asset(
        "img/icons8_tv_60px.png",
        height: 35,
      );
    }
    else if(data == 'PROJECTOR'){
      return Image.asset(
        "img/icons8_video_projector_52px.png",
        height: 35,
      );
    }
    else if(data == 'LIGHT BULB'){
      return Image.asset(
        "img/icons8_idea_60px.png",
        height: 35,
      );
    }
    else if(data == 'AC'){
      return Image.asset(
        "img/icons8_air_conditioner_60px.png",
        height: 35,
      );
    }
    else{
      return Image.asset(
        "img/icons8_contacts_64px.png",
        height: 35,
      );
    }

  }

  Container _container(){
    return Container(
      alignment: Alignment.center,
      height: 85.0,
      child:_icon(),
    );
  }

  Text _textinfo(){
    return Text(
      'MY ' + data,
      style: TextStyle(
        height: -1,
        fontFamily: 'Righteous',
        fontSize: 15.0,
        fontWeight: FontWeight.normal,
        letterSpacing: 1.0,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      textAlign: TextAlign.center,
    );
  }

  Column _DeviceListBuilder(){
    data = _Type();
    final children = <Widget>[];
    children.add(_container());
    children.add(_textinfo());
    return Column(
      children: children,
    );
  }

  ElevatedButton _ButtonBuilder(){
    // log('c: $c');
    // log('count: $count');
    // log('count: ${_ItemCount()}');
    // log('c%count+1: ${(c % (count+1))}');
    if(c % (_ItemCount()+1) == 0){
      log('Here c: $c');
      log('Here count: $count');
      return ElevatedButton(
        onPressed: () async {
          await Get.to(() => Add_Device_1());
        },
        child: Center(
          child: Icon(
            Icons.add_circle,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          primary: Color.fromRGBO(255, 255, 255, 0.00),
        ),
      );
    }
    else if(c % (count+1) - 4 > 0){
      log('${c % (count+1) - 4}');
      // log('$map');
      // log('${map[5]}');
      int cur = c % (count+1);
      log('else if c: $c');
      log('else if cur: $cur');
      log('else if map: $map_index');

      log('else if: ${map[cur]}');
      return ElevatedButton(
        onPressed: ()  => Get.to(
            () => Controller(),
            arguments: [map[cur], cur-4],
        ),
        child: Center(
          child: _DeviceListBuilder(),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          primary: Color.fromRGBO(255, 255, 255, 0.33),
        ),
      );
    }
    else{
      log('else : ${c % (count+1) - 4}');
      return ElevatedButton(
          onPressed: (){},
        // onPressed: ()  => Get.to(
        //     Controller(),
        //   // arguments: [result[0]]
        // ),
        child: Center(
          child: _DeviceListBuilder(),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          primary: Color.fromRGBO(255, 255, 255, 0.33),
        ),
      );
    }
  }

  // void findmap(int cur){
  //   if(){
  //
  //   }
  //
  // }

}
