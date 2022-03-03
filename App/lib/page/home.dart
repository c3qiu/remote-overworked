// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../device/device.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
              padding: EdgeInsets.symmetric(vertical: 160.0, horizontal: 10.0),
              child: ListView(
                children: <Widget>[
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 30.0,
                      mainAxisExtent: 110,
                      childAspectRatio: 3/4,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                        onPressed: ()  => Get.to(Controller()),
                        child: Column(
                          children: <Widget> [
                            Container(
                              alignment: Alignment.center,
                              height: 90.0,
                              child:Icon(
                                Icons.tv,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ),
                            Text(
                              'My PROJECTOR',
                              style: TextStyle(
                                height: -1.5,
                                fontFamily: 'Righteous',
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1.0,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          primary: Color.fromRGBO(255, 255, 255, 0.33),
                        ),
                      );
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
}

//        ),
//     );
//   }
// }
//
// // -------------------------------------
// //
// //
// // SafeArea(
// //   child: GridView.builder(
// //     //itemCount: _movieList != null ?_movieList!.length : 0,
// //     itemBuilder: (context, i) {
// //       return GestureDetector(
// //         onTap: (){
// //           //delegate.push(name: '/details',arguments: {'name':_movieList![i].name,'imgUrl':_movieList![i].imgUrl});
// //         },
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             //Flexible(child: Image.network(_movieList![i].imgUrl)),
// //             //Text(_movieList![i].name),
// //           ],
// //         ),
// //       );
// //     }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //
// //     mainAxisSpacing: 3,
// //     crossAxisSpacing: 2,
// //
// //   ),
// //   ),
// // ),