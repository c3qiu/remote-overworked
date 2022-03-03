import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../device/device.dart';

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
                  colors: const <Color> [Color(0xff052338),Color(0xff1E9370),Color(0xff19424C)],
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
InkWell _inkWell(){
  return InkWell(
    onTap: () {},
    child: Center(
      child: Column(
        children: [
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.router,
                  size: 70.0,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}