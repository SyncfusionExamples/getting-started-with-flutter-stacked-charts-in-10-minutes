import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ExpenseData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCartesianChart(
        title: ChartTitle(
            text: 'Monthly expenses of a family \n (in U.S. Dollars)'),
        legend: Legend(isVisible: true),
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          StackedArea100Series<ExpenseData, String>(
              dataSource: _chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.father,
              name: 'Father',
              markerSettings: MarkerSettings(
                isVisible: true,
              )),
          StackedArea100Series<ExpenseData, String>(
              dataSource: _chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.mother,
              name: 'Mother',
              markerSettings: MarkerSettings(
                isVisible: true,
              )),
          StackedArea100Series<ExpenseData, String>(
              dataSource: _chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.son,
              name: 'Son',
              markerSettings: MarkerSettings(
                isVisible: true,
              )),
          StackedArea100Series<ExpenseData, String>(
              dataSource: _chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.daughter,
              name: 'Daughter',
              markerSettings: MarkerSettings(
                isVisible: true,
              )),
        ],
        primaryXAxis: CategoryAxis(),
      ),
    ));
  }

  List<ExpenseData> getChartData() {
    final List<ExpenseData> chartData = [
      ExpenseData('Food', 55, 40, 45, 48),
      ExpenseData('Transport', 33, 45, 54, 28),
      ExpenseData('Medical', 43, 23, 20, 34),
      ExpenseData('Clothes', 32, 54, 23, 54),
      ExpenseData('Books', 56, 18, 43, 55),
      ExpenseData('Others', 23, 54, 33, 56),
    ];
    return chartData;
  }
}

class ExpenseData {
  ExpenseData(
      this.expenseCategory, this.father, this.mother, this.son, this.daughter);
  final String expenseCategory;
  final num father;
  final num mother;
  final num son;
  final num daughter;
}
