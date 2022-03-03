// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';
import '../device/device.dart';
import 'controller.dart';
import 'add_device1.dart';

int index = 0;
int c = 0;

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
}

List<String> type = ['TV','PROJECTOR','AC','LIGHT BULB'];
String data = '';
int count = 0;

int _ItemCount(){
  count = type.length;
  return count;
}

String _Type(){
  String t = '';
  log('$type');
  index = index % (count);
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

Icon _icon(){
  if(data == 'TV'){
    return Icon(
      Icons.tv,
      color: Colors.black,
      size: 30.0,
    );
  }
  else if(data == 'PROJECTOR'){
    return Icon(
      Icons.videogame_asset,
      color: Colors.black,
      size: 30.0,
    );
  }
  else if(data == 'LIGHT BULB'){
    return Icon(
      Icons.lightbulb,
      color: Colors.black,
      size: 30.0,
    );
  }
  else if(data == 'AC'){
    return Icon(
      Icons.hvac,
      color: Colors.black,
      size: 30.0,
    );
  }
  else{
    return Icon(
      Icons.add,
      color: Colors.black,
      size: 30.0,
    );
  }

}

Container _container(){
  return Container(
    alignment: Alignment.center,
    height: 90.0,
    child:_icon(),
  );
}

Text _textinfo(){
  return Text(
    'MY ' + data,
    style: TextStyle(
      height: -1.5,
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
int n = 1;
ElevatedButton _ButtonBuilder(){
  log('c: $c');
  if(c == n*(_ItemCount() + 1)){
    log('Here c: $c');
    n = n + 1;
    return ElevatedButton(
      onPressed: ()  => Get.to(Add_Device_1()),
      child: Center(
        child: Icon(
          Icons.add_circle,
          color: Colors.white,
          size: 30.0,
        ),
        ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        primary: Color.fromRGBO(255, 255, 255, 0.00),
      ),
    );
  }
  else{
    return ElevatedButton(
      onPressed: ()  => Get.to(Controller()),
      child: Center(
        child: _DeviceListBuilder(),

      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        primary: Color.fromRGBO(255, 255, 255, 0.33),
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