import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'splach_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  //MobileAds.instance.updateRequestConfiguration(
  //  RequestConfiguration(testDeviceIds: ['B7213416069D78D48F927E130F9F3430']));
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'العظماء المائة',
        theme: ThemeData(fontFamily: "fav"),
        home: SplachScreen());
  }
}
