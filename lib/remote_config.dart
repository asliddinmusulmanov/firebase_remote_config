// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:flutter/material.dart';
//
// class BackgroundColor {
//   static final remoteConfig = FirebaseRemoteConfig.instance;
//   static Map<String, Color> colors = {
//     'red': Colors.red,
//     'yellow': Colors.yellow,
//     'indigo': Colors.indigo,
//   };
//   static String backgroundColor = 'white';
//
//   static Future<void> onInit() async {
//     remoteConfig.setDefaults({
//       'backgroundColor': backgroundColor,
//     });
//     await fetch();
//     remoteConfig.onConfigUpdated.listen((event) async {
//       await fetch();
//     });
//   }
//
//   static Future<void> fetch() async {
//     await remoteConfig.fetchAndActivate().then((value) {
//       backgroundColor = remoteConfig.getString('backgroundColor');
//     });
//   }
// }
