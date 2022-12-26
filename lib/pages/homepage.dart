import 'dart:async';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:smoke_polution_monitoring/constant/constant_color.dart';
import 'package:smoke_polution_monitoring/constant/constant_widget.dart';
import 'package:smoke_polution_monitoring/data/data_repo/firestore_repo.dart';
import 'package:smoke_polution_monitoring/data/model/sps30.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    // Timer.periodic(const Duration(seconds: 5), updateDataSource);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  int duration = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("SPS30 Sensor Reading Monitoring"),
        // ),
        body: SafeArea(
      child: Padding(
        padding: padSymR(h: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  gaphr(),
                  const Text(
                    'Smoke Polution Monitoring',
                    style: kwstyleHeaderb35Bold,
                    textAlign: TextAlign.center,
                  ),
                  gaphr(h: 10),
                  const Text(
                    'SPS30',
                    style: kwstyleHeaderb30,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                gapwr(w: double.infinity),
                Material(
                  elevation: 3,
                  shape: cornerR(),
                  child: MaterialButton(
                    minWidth: 250,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/monitorreading');
                    },
                    child: Padding(
                      padding: padSymR(v: 20),
                      child: Column(
                        children: [
                          SizedBox(
                              width: 100,
                              height: 100,
                              child:
                                  Image.asset('assets/images/line-graph.png')),
                          gaphr(h: 10),
                          const Align(
                              alignment: Alignment.center,
                              child: Text('History Sensor Reading'))
                        ],
                      ),
                    ),
                  ),
                ),
                gaphr(),
                Padding(
                  padding: padSymR(v: 20),
                  child: divider(c: kcgrey),
                ),
                gaphr(),
                Material(
                  elevation: 3,
                  shape: cornerR(),
                  child: MaterialButton(
                    minWidth: 250,
                    elevation: 10,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/streamreading');
                    },
                    // shape: cornerR(),
                    child: Padding(
                      padding: padSymR(v: 20),
                      child: Column(
                        children: [
                          SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset('assets/images/increase.png')),
                          gaphr(h: 10),
                          const Align(
                              alignment: Alignment.center,
                              child: Text('Realtime Sensor Reading'))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    )

        // StreamBuilder(
        //     stream: FirestoreRepo().listDataLimit(10),
        //     builder: (_, AsyncSnapshot snapshot) {
        //       if (snapshot.hasData) {
        //         List<Sps30> dataList = snapshot.data;
        //         // List<charts.Series<Sps30,double>> data = dataList
        //         return Column(
        //           children: <Widget>[
        //             SizedBox(
        //               width: double.infinity,
        //               height: 300,
        //               child: charts.TimeSeriesChart(
        //                 flipVerticalAxis: false,
        //                 selectionModels: [charts.SelectionModelConfig()],
        //                 [
        //                   charts.Series<Sps30, DateTime>(
        //                     colorFn: (__, _) =>
        //                         charts.ColorUtil.fromDartColor(Colors.red),
        //                     id: 'NC0.5',
        //                     data: dataList,
        //                     domainFn: (Sps30 sps30, _) => sps30.date!,
        //                     measureFn: (Sps30 sps30, _) => sps30.nc0Dot5,
        //                   ),
        //                   charts.Series<Sps30, DateTime>(
        //                     colorFn: (__, _) =>
        //                         charts.ColorUtil.fromDartColor(Colors.green),
        //                     id: 'NC1.0',
        //                     data: dataList,
        //                     domainFn: (Sps30 sps30, _) => sps30.date!,
        //                     measureFn: (Sps30 sps30, _) => sps30.nc1Dot0,
        //                   ),
        //                   charts.Series<Sps30, DateTime>(
        //                     colorFn: (__, _) =>
        //                         charts.ColorUtil.fromDartColor(Colors.blue),
        //                     id: 'NC2.5',
        //                     data: dataList,
        //                     domainFn: (Sps30 sps30, _) => sps30.date!,
        //                     measureFn: (Sps30 sps30, _) => sps30.nc2Dot5,
        //                   ),
        //                   charts.Series<Sps30, DateTime>(
        //                     colorFn: (__, _) =>
        //                         charts.ColorUtil.fromDartColor(Colors.purple),
        //                     id: 'NC4.0',
        //                     data: dataList,
        //                     domainFn: (Sps30 sps30, _) => sps30.date!,
        //                     measureFn: (Sps30 sps30, _) => sps30.nc4dot0,
        //                   ),
        //                   charts.Series<Sps30, DateTime>(
        //                     colorFn: (__, _) =>
        //                         charts.ColorUtil.fromDartColor(Colors.orange),
        //                     id: 'NC10.0',
        //                     data: dataList,
        //                     domainFn: (Sps30 sps30, _) => sps30.date!,
        //                     measureFn: (Sps30 sps30, _) => sps30.nc10Dot0,
        //                   ),
        //                 ],
        //                 defaultRenderer: charts.LineRendererConfig(
        //                   includeLine: true,
        //                   includePoints: false,
        //                   roundEndCaps: false,
        //                   includeArea: true,
        //                   stacked: true,
        //                 ),
        //                 animate: false,
        //                 animationDuration: Duration(seconds: 1),
        //                 behaviors: [
        //                   charts.ChartTitle(
        //                     "Day",
        //                     behaviorPosition: charts.BehaviorPosition.bottom,
        //                     titleOutsideJustification:
        //                         charts.OutsideJustification.middleDrawArea,
        //                   ),
        //                   charts.ChartTitle(
        //                     'Concentration',
        //                     behaviorPosition: charts.BehaviorPosition.start,
        //                     titleOutsideJustification:
        //                         charts.OutsideJustification.middleDrawArea,
        //                   )
        //                 ],
        //                 dateTimeFactory: charts.LocalDateTimeFactory(),
        //               ),
        //             ),
        //             // SizedBox(
        //             //   height: 300,
        //             //   width: double.infinity,
        //             //   child: charts.LineChart([
        //             //     charts.Series<Sps30, int>(
        //             //       colorFn: (__, _) =>
        //             //           charts.ColorUtil.fromDartColor(Colors.red),
        //             //       id: 'NC0.5',
        //             //       data: dataList,
        //             //       domainFn: (Sps30 sps30, _) => sps30.date!.minute,
        //             //       measureFn: (Sps30 sps30, _) => sps30.pm1dot0,
        //             //     ),
        //             //     charts.Series<Sps30, int>(
        //             //       colorFn: (__, _) =>
        //             //           charts.ColorUtil.fromDartColor(Colors.green),
        //             //       id: 'NC1.0',
        //             //       data: dataList,
        //             //       domainFn: (Sps30 sps30, _) => sps30.date!.minute,
        //             //       measureFn: (Sps30 sps30, _) => sps30.pm2dot5,
        //             //     ),
        //             //     charts.Series<Sps30, int>(
        //             //       colorFn: (__, _) =>
        //             //           charts.ColorUtil.fromDartColor(Colors.blue),
        //             //       id: 'NC2.5',
        //             //       data: dataList,
        //             //       domainFn: (Sps30 sps30, _) => sps30.date!.minute,
        //             //       measureFn: (Sps30 sps30, _) => sps30.pm4dot0,
        //             //     ),
        //             //     charts.Series<Sps30, int>(
        //             //       colorFn: (__, _) =>
        //             //           charts.ColorUtil.fromDartColor(Colors.purple),
        //             //       id: 'NC4.0',
        //             //       data: dataList,
        //             //       domainFn: (Sps30 sps30, _) => sps30.date!.minute,
        //             //       measureFn: (Sps30 sps30, _) => sps30.pm10dot0,
        //             //     ),
        //             //   ]),
        //             //   // child: SfCartesianChart(series: [
        //             //   //   LineSeries<Sps30, double>(
        //             //   //     color: kcBlack,
        //             //   //     dataSource: dataList,
        //             //   //     xValueMapper: (Sps30 sps30, _) => sps30.pm1dot0,
        //             //   //     yValueMapper: (Sps30 sps30, _) => sps30.date!.second,
        //             //   //   ),
        //             //   //   LineSeries<Sps30, double>(
        //             //   //     color: Colors.green,
        //             //   //     dataSource: dataList,
        //             //   //     xValueMapper: (Sps30 sps30, _) => sps30.pm2dot5,
        //             //   //     yValueMapper: (Sps30 sps30, _) => sps30.date!.second,
        //             //   //   ),
        //             //   //   LineSeries<Sps30, double>(
        //             //   //       color: Colors.blue,
        //             //   //       dataSource: dataList,
        //             //   //       xValueMapper: (Sps30 sps30, _) => sps30.pm4dot0,
        //             //   //       yValueMapper: (Sps30 sps30, _) => sps30.date!.second),
        //             //   //   LineSeries<Sps30, double>(
        //             //   //     color: Colors.red,
        //             //   //     dataSource: dataList,
        //             //   //     xValueMapper: (Sps30 sps30, _) => sps30.pm10dot0,
        //             //   //     yValueMapper: (Sps30 sps30, _) => sps30.date!.second,
        //             //   //   ),
        //             //   // ]),
        //             // )

        //             SizedBox(
        //               width: double.infinity,
        //               height: 300,
        //               child: charts.TimeSeriesChart(
        //                 selectionModels: [charts.SelectionModelConfig()],
        //                 [
        //                   charts.Series<Sps30, DateTime>(
        //                     colorFn: (__, _) =>
        //                         charts.ColorUtil.fromDartColor(Colors.red),
        //                     id: 'PM1.0',
        //                     data: dataList,
        //                     domainFn: (Sps30 sps30, _) => sps30.date!,
        //                     measureFn: (Sps30 sps30, _) => sps30.pm1dot0,
        //                   ),
        //                   charts.Series<Sps30, DateTime>(
        //                     colorFn: (__, _) =>
        //                         charts.ColorUtil.fromDartColor(Colors.green),
        //                     id: 'PM2.5',
        //                     data: dataList,
        //                     domainFn: (Sps30 sps30, _) => sps30.date!,
        //                     measureFn: (Sps30 sps30, _) => sps30.pm2dot5,
        //                   ),
        //                   charts.Series<Sps30, DateTime>(
        //                     colorFn: (__, _) =>
        //                         charts.ColorUtil.fromDartColor(Colors.blue),
        //                     id: 'PM4.0',
        //                     data: dataList,
        //                     domainFn: (Sps30 sps30, _) => sps30.date!,
        //                     measureFn: (Sps30 sps30, _) => sps30.pm4dot0,
        //                   ),
        //                   charts.Series<Sps30, DateTime>(
        //                     colorFn: (__, _) =>
        //                         charts.ColorUtil.fromDartColor(Colors.purple),
        //                     id: 'PM10.0',
        //                     data: dataList,
        //                     domainFn: (Sps30 sps30, _) => sps30.date!,
        //                     measureFn: (Sps30 sps30, _) => sps30.pm10dot0,
        //                   ),
        //                 ],
        //                 defaultRenderer: charts.LineRendererConfig(
        //                   includeLine: true,
        //                   includePoints: false,
        //                   roundEndCaps: false,
        //                   includeArea: true,
        //                   stacked: true,
        //                 ),
        //                 animate: false,
        //                 animationDuration: Duration(seconds: 1),
        //                 behaviors: [
        //                   charts.ChartTitle(
        //                     "Day",
        //                     behaviorPosition: charts.BehaviorPosition.bottom,
        //                     titleOutsideJustification:
        //                         charts.OutsideJustification.middleDrawArea,
        //                   ),
        //                   charts.ChartTitle(
        //                     'Particular Matter',
        //                     behaviorPosition: charts.BehaviorPosition.start,
        //                     titleOutsideJustification:
        //                         charts.OutsideJustification.middleDrawArea,
        //                   )
        //                 ],
        //                 dateTimeFactory: charts.LocalDateTimeFactory(),
        //               ),
        //             ),
        //             gaphr(),
        //           ],
        //         );
        //       } else {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //     }),

        );
  }

  // void updateDataSource(Timer timer) {
  //   setState(() {
  //     duration = timer.tick;
  //     print(duration);
  //   });
  // }
}
