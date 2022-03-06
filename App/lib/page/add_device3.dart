import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'home.dart';
import 'add_device4.dart';

class Model_Select_info extends StatefulWidget {
  const Model_Select_info({Key? key}) : super(key: key);
  @override
  _device_info createState() => _device_info();
}

class _device_info extends State<Model_Select_info> {
  Color _colorSelect = Color.fromRGBO(255, 255, 255, 0.4);
  Color _colorNonSelect = Color.fromRGBO(255, 255, 255, 0.25);
  List<String> samsung = ['Model 1', 'Model 2', 'Model 3', 'Model 4', 'Model 5', 'Model 6', 'Model 7'];
  List<String> lg = ['Model 1', 'Model 2', 'Model 3', 'Model 4'];
  List<String> models = [];
  late List pressAction;
  int index = 0;
  int j = 0;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    // final details = Get.arguments;
    // log('${details}');
    String brandname = Get.arguments[1].toString();

    if(brandname == 'samsung'){
      models = samsung;
    }
    else if(brandname == 'lg'){
      models = lg;
    }

    pressAction = List.filled(models.length, false);
    j = 0;
    //log('$pressAction');

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
                'Select your TV model...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 8.0,
                  fontFamily: 'Righteous',
                  fontSize: 22.0,
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
                        height: 74,
                        margin: const EdgeInsets.only(top: 130.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color.fromRGBO(255, 255, 255, 0.0),
                        ),
                      ),
                      // Model Type
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: _modelSelect(),
                        )
                      ),
                      // empty box
                      Container(
                        width: double.infinity,
                        height: 54,
                        margin: const EdgeInsets.only(bottom: 0.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color.fromRGBO(255, 255, 255, 0.0),
                        ),
                      ),
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

  Ink _modelButton(int n){
    return Ink(
      child: InkWell(
          child: _card(),
          onTap: () {
            log('model type selected');
            _passValue(n);
          }
      ),
    );
  }

  List<Widget> _modelSelect(){
    final children = <Widget>[];
    for(var i = 0; i < models.length; i++){
      children.add(_modelButton(i+1));
    }
    return children;
  }

  Text _modeltype(){
    String t = '';
    index = index % models.length;
    t = models[index];
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

  int cur = 10000000;

  void _passValue(int n){
      setState(() {
        for(var i = 0; i < pressAction.length; i++){
          // log('Here');
          // log('i: $i');
          if(i == n-1){
            // log('i here: $i');
            pressAction[i] = true;
            cur = i;
          }
          else{
            pressAction[i] = false;
          }
        }
        //log('$pressAction');
        Get.to(
                () => Add_Device_4(),
            arguments: [Get.arguments[0], Get.arguments[1],'model$n',]
        );
      });
  }

  Color _stateColor(){
    // log('cur: $cur');
    if(cur != 10000000){
      pressAction[cur] = true;
    }
    if(cur < pressAction.length){
      // for(j; j < pressAction.length; j++){
        return pressAction[j++] ? _colorSelect : _colorNonSelect;
      // }
    }
    return _colorNonSelect;
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
      child: Center(child: _modeltype(),),
    );
  }
}