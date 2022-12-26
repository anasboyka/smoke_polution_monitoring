import 'package:charts_flutter_new/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:smoke_polution_monitoring/constant/constant_color.dart';
import 'package:smoke_polution_monitoring/constant/constant_widget.dart';
import 'package:smoke_polution_monitoring/data/data_repo/firestore_repo.dart';
import 'package:smoke_polution_monitoring/data/model/bar_data.dart';
import 'package:smoke_polution_monitoring/data/model/sps30.dart';

class StreamReading extends StatefulWidget {
  const StreamReading({Key? key}) : super(key: key);

  @override
  State<StreamReading> createState() => _StreamReadingState();
}

class _StreamReadingState extends State<StreamReading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcTransparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: kcBlack,
        ),
      ),
      body: StreamBuilder(
          stream: FirestoreRepo().streamSps(),
          builder: (_, AsyncSnapshot snapshot) {
            //print(snapshot);
            if (snapshot.hasData) {
              Sps30 sps30 = snapshot.data;
              List<BarData> barDataPm = [
                BarData("PM1.0", sps30.pm1dot0!),
                BarData("PM2.5", sps30.pm2dot5!),
                BarData("PM4.0", sps30.pm4dot0!),
                BarData("PM10.0", sps30.pm10dot0!),
              ];
              List<BarData> barDataNc = [
                BarData("NC0.5", sps30.nc0Dot5!),
                BarData("NC1.0", sps30.nc1Dot0!),
                BarData("NC2.5", sps30.nc2Dot5!),
                BarData("NC4.0", sps30.nc4dot0!),
                BarData("NC10.0", sps30.nc10Dot0!),
              ];
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      gaphr(),
                      const Text(
                        "SPS30 Sensor Reading",
                        style: kwstyleHeaderb30,
                      ),
                      gaphr(),
                      Padding(
                        padding: padSymR(),
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: charts.BarChart(
                            barRendererDecorator: (charts.BarLabelDecorator(
                              // insideLabelStyleSpec: const TextStyleSpec(
                              //   fontSize: 12,
                              //   color: Color.black,
                              // ),
                              labelPosition: BarLabelPosition.inside,
                              labelAnchor: BarLabelAnchor.end,
                              insideLabelStyleSpec: const TextStyleSpec(
                                fontSize: 12,
                                color: Color.white,
                              ),
                              outsideLabelStyleSpec: const TextStyleSpec(
                                fontSize: 12,
                                color: Color.black,
                              ),
                            )),

                            // primaryMeasureAxis: new charts.NumericAxisSpec(
                            //     renderSpec: new charts.NoneRenderSpec()),
                            // domainAxis: new charts.OrdinalAxisSpec(
                            //     showAxisLine: true,
                            //     renderSpec: new charts.NoneRenderSpec()),
                            // layoutConfig: new charts.LayoutConfig(
                            //     leftMarginSpec: new charts.MarginSpec.fixedPixel(0),
                            //     topMarginSpec: new charts.MarginSpec.fixedPixel(0),
                            //     rightMarginSpec:
                            //         new charts.MarginSpec.fixedPixel(0),
                            //     bottomMarginSpec:
                            //         new charts.MarginSpec.fixedPixel(0)),
                            [
                              charts.Series<BarData, String>(
                                id: 'PM',
                                data: barDataPm,
                                domainFn: (BarData data, _) => data.x,
                                measureFn: (BarData data, _) => data.y,
                                displayName: 'display',
                                seriesCategory: 'category',
                                colorFn: (__, _) =>
                                    charts.ColorUtil.fromDartColor(
                                        Colors.green),
                                labelAccessorFn: (BarData barData, _) =>
                                    '${barData.y}  ',
                              ),
                            ],
                            domainAxis: charts.OrdinalAxisSpec(),
                            animate: true,
                            animationDuration: Duration(milliseconds: 300),
                          ),
                        ),
                      ),
                      gaphr(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'PM1.0: ',
                                style: kwtextStyleRD(),
                              ),
                              Text(
                                sps30.pm1dot0!.toStringAsFixed(2),
                                style: kwtextStyleRD(fw: kfbold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'PM2.5: ',
                                style: kwtextStyleRD(),
                              ),
                              Text(
                                sps30.pm2dot5!.toStringAsFixed(2),
                                style: kwtextStyleRD(fw: kfbold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'PM4.0: ',
                                style: kwtextStyleRD(),
                              ),
                              Text(
                                sps30.pm4dot0!.toStringAsFixed(2),
                                style: kwtextStyleRD(fw: kfbold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'PM10.0: ',
                                style: kwtextStyleRD(),
                              ),
                              Text(
                                sps30.pm10dot0!.toStringAsFixed(2),
                                style: kwtextStyleRD(fw: kfbold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      gaphr(),
                      Padding(
                        padding: padSymR(),
                        child: divider(),
                      ),
                      gaphr(),
                      Padding(
                        padding: padSymR(),
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: charts.BarChart(
                            barRendererDecorator: (charts.BarLabelDecorator(
                              insideLabelStyleSpec: const TextStyleSpec(
                                fontSize: 12,
                                color: Color.white,
                              ),
                              outsideLabelStyleSpec: const TextStyleSpec(
                                fontSize: 12,
                                color: Color.black,
                              ),
                            )),
                            // primaryMeasureAxis: new charts.NumericAxisSpec(
                            //     renderSpec: new charts.NoneRenderSpec()),
                            // domainAxis: new charts.OrdinalAxisSpec(
                            //     showAxisLine: true,
                            //     renderSpec: new charts.NoneRenderSpec()),
                            // layoutConfig: new charts.LayoutConfig(
                            //     leftMarginSpec: new charts.MarginSpec.fixedPixel(0),
                            //     topMarginSpec: new charts.MarginSpec.fixedPixel(0),
                            //     rightMarginSpec:
                            //         new charts.MarginSpec.fixedPixel(0),
                            //     bottomMarginSpec:
                            //         new charts.MarginSpec.fixedPixel(0)),
                            [
                              charts.Series<BarData, String>(
                                id: 'NC',
                                data: barDataNc,
                                domainFn: (BarData data, _) => data.x,
                                measureFn: (BarData data, _) => data.y,
                                displayName: 'display',
                                seriesCategory: 'category',
                                colorFn: (__, _) =>
                                    charts.ColorUtil.fromDartColor(
                                        Colors.green),
                                labelAccessorFn: (BarData barData, _) =>
                                    '${barData.y}  ',
                              ),
                            ],
                            animate: true,
                            animationDuration: Duration(milliseconds: 300),
                          ),
                        ),
                      ),
                      gaphr(h: 10),
                      Padding(
                        padding: padSymR(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'NC0.5: ',
                                  style: kwtextStyleRD(),
                                ),
                                Text(
                                  sps30.nc0Dot5!.toStringAsFixed(2),
                                  style: kwtextStyleRD(fw: kfbold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'NC0.5: ',
                                  style: kwtextStyleRD(),
                                ),
                                Text(
                                  sps30.nc0Dot5!.toStringAsFixed(2),
                                  style: kwtextStyleRD(fw: kfbold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'NC0.5: ',
                                  style: kwtextStyleRD(),
                                ),
                                Text(
                                  sps30.nc0Dot5!.toStringAsFixed(2),
                                  style: kwtextStyleRD(fw: kfbold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      gaphr(h: 10),
                      Padding(
                        padding: padSymR(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'NC0.5: ',
                                  style: kwtextStyleRD(),
                                ),
                                Text(
                                  sps30.nc0Dot5!.toStringAsFixed(2),
                                  style: kwtextStyleRD(fw: kfbold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'NC0.5: ',
                                  style: kwtextStyleRD(),
                                ),
                                Text(
                                  sps30.nc0Dot5!.toStringAsFixed(2),
                                  style: kwtextStyleRD(fw: kfbold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      gaphr(),
                      Padding(
                        padding: padSymR(),
                        child: divider(c: kcDivider, t: 2),
                      ),
                      gaphr(),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Particle Size',
                          style: kwtextStyleRD(
                            fs: 25,
                            fw: kfmedium,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          sps30.particleSize!.toStringAsFixed(2),
                          style: kwtextStyleRD(
                            fs: 25,
                            fw: kfbold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
