import 'package:ekonometri/result_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int elementCount;
  const HomePage({Key? key, required this.elementCount}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<List<double>> numbersList;
  late List<double> YList;
  late List<double> X2List;
  late List<double> X3List;

  @override
  void initState() {
    numbersList = List.filled(3, List.filled(widget.elementCount, 0.0));
    YList = List.filled(widget.elementCount, 0.0);
    X2List = List.filled(widget.elementCount, 0.0);
    X3List = List.filled(widget.elementCount, 0.0);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextButton(
          onPressed: (){
            numbersList[0] = YList;
            numbersList[1] = X2List;
            numbersList[2] = X3List;
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(numbersList: numbersList, elementCount: widget.elementCount,)));
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
          ),
          child: const Text('Hesapla'),
        ),
      ),
      body: Table(
        border: TableBorder.all(),
        children: [
          const TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('no', textAlign: TextAlign.center,),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('Y', textAlign: TextAlign.center,),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('X2', textAlign: TextAlign.center,),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('X3', textAlign: TextAlign.center,),
                  ),
                ),
              ]
          ),
          ...List.generate(widget.elementCount, (i) => TableRow(
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text('${i+1}', textAlign: TextAlign.center,),
                ),
                TableCell(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      YList[i] = double.tryParse(value)!;
                    },
                  ),
                ),
                TableCell(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      X2List[i] = double.tryParse(value)!;
                    },
                  ),
                ),
                TableCell(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      X3List[i] = double.tryParse(value)!;
                    },
                  ),
                ),
              ]
          ),),
        ],
      ),
    );
  }
}