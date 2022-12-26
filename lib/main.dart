import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smoke_polution_monitoring/constant/constant_color.dart';
import 'package:smoke_polution_monitoring/data/data_repo/firestore_repo.dart';
import 'package:smoke_polution_monitoring/data/model/sps30.dart';
import 'package:smoke_polution_monitoring/pages/homepage.dart';
import 'package:smoke_polution_monitoring/pages/monitor_reading.dart';
import 'package:smoke_polution_monitoring/pages/stream_reading.dart';
import 'package:smoke_polution_monitoring/route_generator.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: kcprimarySwatch,
            ),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        });
  }
}
