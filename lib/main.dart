import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

String actualYear = '2020';

//Used to check if actualYear already been defined in Switch statement.
int flagYear = 0;

const double cellWidth = 35.0;
const double cellHeight = 35.0;
const double cellFontSize = 17.0;
const double cellTopPadding = 6.0;
const double marginEdgeInset = 1.0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    config();
    return MaterialApp(
      title: 'Escala de turno 3x2',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Escala de turno 3x2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

void config() {
  //Setting application in fullscreen mode.
  // SystemChrome.setEnabledSystemUIOverlays([]);
  // SystemChrome.setEnabledSystemUIMode;
  //Setting the orientation of the app in landscape mode.
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
}

Container containerCell(String cellValue, bool cellBold) {
  return Container(
    margin: EdgeInsets.all(marginEdgeInset),
    height: cellWidth,
    width: cellWidth,
    color: Colors.white,
    padding: EdgeInsets.only(top: cellTopPadding),
    child: Text(
      cellValue,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'PTSansNarrow',
        fontSize: cellFontSize,
        color: (cellValue == 'F') ? Colors.orange[700] : Colors.black87,
        fontWeight: cellBold ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  );
}

Container containerCellDaysOfWeek(String cellValue, bool cellBold) {
  return Container(
    margin: EdgeInsets.all(marginEdgeInset),
    height: cellWidth,
    width: cellWidth,
    color: Colors.white,
    padding: EdgeInsets.only(top: cellTopPadding),
    child: Text(
      cellValue,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'PTSansNarrow',
        fontSize: cellFontSize - 2.0,
        color: Colors.green[900],
        fontWeight: cellBold ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  );
}

Container containerCellGroups(String groupName, [Color colorGroup]) {
  return Container(
    margin: EdgeInsets.fromLTRB(
        0.0, marginEdgeInset, marginEdgeInset, marginEdgeInset),
    height: cellHeight,
    width: cellWidth,
    color: colorGroup,
    padding: EdgeInsets.only(top: cellTopPadding),
    child: Text(
      groupName,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'PTSansNarrow',
        fontSize: cellFontSize,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Container containerCellDate(String cellValue, bool cellBold) {
  return Container(
    margin: EdgeInsets.all(marginEdgeInset),
    height: cellWidth,
    width: cellWidth,
    color: Colors.white,
    padding: EdgeInsets.only(top: cellTopPadding),
    child: Text(
      cellValue,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'PTSansNarrow',
        fontSize: 12.0,
        color: Colors.black54,
        letterSpacing: -0.5,
        fontWeight: cellBold ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  );
}

Column columnContainerCell(String dayOfWeek, String groupA, String groupB,
    String groupC, String groupD, String groupE, String dayOfYear) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
//    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      containerCellDate(dayOfYear, true),
      containerCellDaysOfWeek(dayOfWeek, true),
      containerCell(groupA, false),
      containerCell(groupB, false),
      containerCell(groupC, false),
      containerCell(groupD, false),
      containerCell(groupE, false),
    ],
  );
}

class _MyHomePageState extends State<MyHomePage> {
  int actualDayOfWeek;
  int actualChange = 0;
  int groupA = 0;
  int groupB = 0;
  int groupC = 0;
  int groupD = 0;
  int groupE = 0;

  int A = 0;
  int B = 0;
  int C = 0;
  int D = 0;
  int E = 0;
  int Y = 0;
  String X;

  List<String> dayOfWeek = ['SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB', 'DOM'];
  List<String> daysOfChange = [
    '7',
    '7',
    '7',
    'F',
    'F',
    '15',
    '15',
    '15',
    'F',
    'F',
    '23',
    '23',
    '23',
    'F',
    'F'
  ];

  List<Widget> changes = [];

  List<Widget> createChanges() {
    //Defining which will be the year's start day.
    if (flagYear == 0) {
      flagYear = 1;
      switch (actualYear) {
        case '2020':
          actualDayOfWeek = 6;
          groupA = 7;
          groupB = 10;
          groupC = 13;
          groupD = 1;
          groupD = 4;
          break;
        case '2021':
          actualDayOfWeek = 5;
          break;
        case '2022':
          actualDayOfWeek = 6;
          break;
      }
    }

//    print(flagYear);
    //TODO: Implement Switch for another years.
    DateTime date = DateTime(2020, 2);
//    print(date);
    for (int i = 0; i <= 334; i++) {
      print(date.add(Duration(days: i)));
      X = date.add(Duration(days: i)).toString().substring(8, 10) +
          '/' +
          date.add(Duration(days: i)).toString().substring(5, 7);
      print(X);

      Y = date.add(Duration(days: i)).weekday;
      print(date.add(Duration(days: i)).weekday.toString());

//      if (actualDayOfWeek < 7) {
//        W = actualDayOfWeek;
//      } else {
//        actualDayOfWeek = 0;
//        W = actualDayOfWeek;
////        actualDayOfWeek++;
//      }

      if (groupA <= 14) {
        A = groupA;
//        groupA++;
      } else {
        groupA = 0;
        A = groupA;
//        groupA++;
      }
      if (groupB <= 14) {
        B = groupB;
//        groupB++;
      } else {
        groupB = 0;
        B = groupB;
//        groupB++;
      }
      if (groupC <= 14) {
        C = groupC;
//        groupC++;
      } else {
        groupC = 0;
        C = groupC;
//        groupC++;
      }
      if (groupD <= 14) {
        D = groupD;
//        groupD++;
      } else {
        groupD = 0;
        D = groupD;
//        groupD++;
      }
      if (groupE <= 14) {
        E = groupE;
//        groupE++;
      } else {
        groupE = 0;
        E = groupE;
//        groupE++;
      }

      changes.add(
        columnContainerCell(
          dayOfWeek[Y - 1],
          daysOfChange[A],
          daysOfChange[B],
          daysOfChange[C],
          daysOfChange[D],
          daysOfChange[E],
          X,
        ),
      );
      actualDayOfWeek++;
      groupA++;
      groupB++;
      groupC++;
      groupD++;
      groupE++;
    }
//  print(actualChange);
    return changes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//      appBar: AppBar(
//        title: Text('Escala 3x2'),
//      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Text(
          '2020',
          style: TextStyle(
            fontFamily: 'PTSansNarrow',
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(50.0, 0.0, 120.0, 0.0),
              child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: createChanges(),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                containerCellGroups('', Colors.transparent),
                containerCellGroups('', Colors.transparent),
                containerCellGroups('A', Colors.green),
                containerCellGroups('B', Colors.green),
                containerCellGroups('C', Colors.green),
                containerCellGroups('D', Colors.green),
                containerCellGroups('E', Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*SizedBox(
height: 200.0,
width: 1.0,
child: Divider(
color: Colors.black26,
),
),*/
