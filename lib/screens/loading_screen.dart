import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather/utils/location.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LocationHelper locationData;
  Future<void>getLocationData() async{
    locationData=LocationHelper();
    await locationData.getCurrentLocation();
    if(locationData.latitude==null || locationData.longitude==null){
      print("Konum bilgileri gelmiyor");
    }
    else{
      print("latitude:"+locationData.latitude.toString());
      print("latitude:"+locationData.longitude.toString());
    }
  }
  @override
  
  void initState() {
    super.initState();
    getLocationData();
    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration:BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors:[Colors.purple,Colors.blue]),
        ) ,
        child: Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 150,
            duration:Duration(milliseconds: 1200) ,
          ),
        )

      ),
    );
  }
}