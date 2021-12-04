import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final List<List<double>> numbersList;
  final int elementCount;
  const ResultPage({
    Key? key,
    required this.numbersList,
    required this.elementCount,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late List<List<double>> resultNumbersList;
  late List<double> yList;
  late List<double> x2List;
  late List<double> x3List;
  late List<double> yMx2List;
  late List<double> yMx3List;
  late List<double> x2SqList;
  late List<double> x3SqList;
  late List<double> x2Mx3List;

  double yListTotal = 0;
  double x2ListTotal = 0;
  double x3ListTotal = 0;
  double yMx2ListTotal = 0;
  double yMx3ListTotal = 0;
  double x2SqListTotal = 0;
  double x3SqListTotal = 0;
  double x2Mx3ListTotal = 0;


  double _Y = 0;
  double _X2 = 0;
  double _X3 = 0;

  @override
  void initState() {
    resultNumbersList = List.filled(8, List.filled(widget.elementCount, 0.0));
    yList = List.filled(widget.elementCount, 0.0);
    x2List = List.filled(widget.elementCount, 0.0);
    x3List = List.filled(widget.elementCount, 0.0);
    yMx2List = List.filled(widget.elementCount, 0.0);
    yMx3List = List.filled(widget.elementCount, 0.0);
    x2SqList = List.filled(widget.elementCount, 0.0);
    x3SqList = List.filled(widget.elementCount, 0.0);
    x2Mx3List = List.filled(widget.elementCount, 0.0);

    double yTotal = 0;
    double x2Total = 0;
    double x3Total = 0;
    for (int i = 0; i < widget.elementCount; i++) {
      yTotal += widget.numbersList[0][i];
      x2Total += widget.numbersList[1][i];
      x3Total += widget.numbersList[2][i];
    }
    _Y = yTotal / widget.elementCount;
    _X2 = x2Total / widget.elementCount;
    _X3 = x3Total / widget.elementCount;

    //yList

    for (int i = 0; i < widget.elementCount; i++) {
      yList[i] = widget.numbersList[0][i] - _Y;
      x2List[i] = widget.numbersList[1][i] - _X2;
      x3List[i] = widget.numbersList[2][i] - _X3;
    }

    for (int i = 0; i < widget.elementCount; i++) {
      yMx2List[i] = widget.numbersList[0][i] * x2List[i];
      yMx3List[i] = widget.numbersList[0][i] * x3List[i];
      x2SqList[i] = x2List[i] * x2List[i];
      x3SqList[i] = x3List[i] * x3List[i];
      x2Mx3List[i] = x2List[i] * x3List[i];
    }


    yListTotal = yList.reduce((a, b) => a + b);
    x2ListTotal = x2List.reduce((a, b) => a + b);
    x3ListTotal = x3List.reduce((a, b) => a + b);
    yMx2ListTotal = yMx2List.reduce((a, b) => a + b);
    yMx3ListTotal = yMx3List.reduce((a, b) => a + b);
    x2SqListTotal = x2SqList.reduce((a, b) => a + b);
    x3SqListTotal = x3SqList.reduce((a, b) => a + b);
    x2Mx3ListTotal = x2Mx3List.reduce((a, b) => a + b);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: const [
                RowCell(
                  text: 'y',
                ),
                RowCell(
                  text: 'x2',
                ),
                RowCell(
                  text: 'x3',
                ),
                RowCell(
                  text: 'y*x2',
                ),
                RowCell(
                  text: 'y*x3',
                ),
                RowCell(
                  text: 'x2^2',
                ),
                RowCell(
                  text: 'x3^2',
                ),
                RowCell(
                  text: 'x2*x3',
                ),
              ],
            ),
            ...List.generate(widget.elementCount,
                  (i) =>
                      Row(
              children: [
                RowCell(
                  text: yList[i].toStringAsFixed(4),
                ),
                RowCell(
                  text: x2List[i].toStringAsFixed(4),
                ),
                RowCell(
                  text: x3List[i].toStringAsFixed(4),
                ),
                RowCell(
                  text: yMx2List[i].toStringAsFixed(4),
                ),
                RowCell(
                  text: yMx3List[i].toStringAsFixed(4),
                ),
                RowCell(
                  text: x2SqList[i].toStringAsFixed(4),
                ),
                RowCell(
                  text: x3SqList[i].toStringAsFixed(4),
                ),
                RowCell(
                  text: x2Mx3List[i].toStringAsFixed(4),
                ),
              ],
            ),
            ),
            Row(
              children: List.generate(8, (index) =>
                  const RowCell(
                    text: 'Toplam',
                  ),
              ),
            ),
            Row(
              children: [
                RowCell(
                  text: yListTotal.toStringAsFixed(4),
                ),
                RowCell(
                  text: x2ListTotal.toStringAsFixed(4),
                ),
                RowCell(
                  text: x3ListTotal.toStringAsFixed(4),
                ),
                RowCell(
                  text: yMx2ListTotal.toStringAsFixed(4),
                ),
                RowCell(
                  text: yMx3ListTotal.toStringAsFixed(4),
                ),
                RowCell(
                  text: x2SqListTotal.toStringAsFixed(4),
                ),
                RowCell(
                  text: x3SqListTotal.toStringAsFixed(4),
                ),
                RowCell(
                  text: x2Mx3ListTotal.toStringAsFixed(4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RowCell extends StatelessWidget {
  final String text;
  const RowCell({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 30.0,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
