import 'package:flutter/material.dart';
import 'package:smoke_polution_monitoring/pages/homepage.dart';
import 'package:smoke_polution_monitoring/pages/monitor_reading.dart';
import 'package:smoke_polution_monitoring/pages/stream_reading.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case '/streamreading':
        return MaterialPageRoute(builder: (_) => StreamReading());
      case '/monitorreading':
        return MaterialPageRoute(builder: (_) => MonitorReading());
      default:
        return MaterialPageRoute(builder: (_) => MyHomePage());
    }
  }
}
