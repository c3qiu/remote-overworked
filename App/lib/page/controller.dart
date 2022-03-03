import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../device/device.dart';

String type = 'TV';

class Controller extends StatelessWidget {
  const Controller({Key? key}) : super(key: key);

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
                  colors: const <Color> [Color(0xff052338),Color(0xff1E9370),Color(0xff19424C)],
                ),
              ),
            ),
            // Title
            Text(
              ' MY ' + type + ':',
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
              onTap: () => Get.back(),
              child: Container(
                height: 55.0,
                margin: const EdgeInsets.only(left:320.0, top:10.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.65),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.tv,
                    color: Colors.black,
                    size: 35.0,
                  ),
                ),
              ),
            ),
            // Controller Box
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 100.0),
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
                  // --------------------
                  // Power Button
                  GestureDetector(
                    onTap: () {
                      print('Power ON/OFF');
                      ////////////////////////////////////////////////////////////////////////////
                      // TODO
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
                      ////////////////////////////////////////////////////////////////////////////
                      // TODO
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
                      ////////////////////////////////////////////////////////////////////////////
                      // TODO
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
                      ////////////////////////////////////////////////////////////////////////////
                      // TODO
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
                      ////////////////////////////////////////////////////////////////////////////
                      // TODO
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
                      ////////////////////////////////////////////////////////////////////////////
                      // TODO
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
                      ////////////////////////////////////////////////////////////////////////////
                      // TODO
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
                      ////////////////////////////////////////////////////////////////////////////
                      // TODO
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
                      ////////////////////////////////////////////////////////////////////////////
                      // TODO
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
                      ////////////////////////////////////////////////////////////////////////////
                      // TODO
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
                      ////////////////////////////////////////////////////////////////////////////
                      // TODO
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class  extends StatelessWidget {
//   const Controller({Key? key}) : super(key: key);
// //
// //   @override
// //   _Remote_Control createState() => _Remote_Control();
// // }
// //
// // class _Remote_Control extends State<Controller> {
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     // Service.fetchMovieList().then((value) {
// //     //   setState(() {
// //     //     _movieList = value;
// //     //   });
// //     // });
// //   }
//