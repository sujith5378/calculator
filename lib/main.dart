// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import 'keys.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      backgroundColor: Color(0xFF28527a),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(_history,style: TextStyle(fontSize: 24,color: Color(0x66FFFFFF),fontWeight: FontWeight.bold),),),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(_expression,style: TextStyle(fontSize: 48,color: Colors.white,fontWeight: FontWeight.bold),),),
                ],
              ),
            ),
            Row(
              children: [
                    key(data: "AC",fillColor: 0XFFFFA500,callback: allClear),
                    key(data: "C",fillColor: 0XFFFFA500,callback: clear),
                    key(data: "<",fillColor: 0XFFFFA500,callback: numClick),
                    key(data: "/",fillColor: 0XFFFFA500,callback: numClick)
                  ],),
            Row(
              children: [
                    key(data: "7",callback: numClick, ),
                    key(data: "8",callback: numClick, ),
                    key(data: "9",callback: numClick, ),
                    key(data: "*",fillColor: 0XFFFFA500,callback: numClick)
                  ],),
            Row(
              children: [
                    key(data: "4",callback: numClick, ),
                    key(data: "5",callback: numClick, ),
                    key(data: "6",callback: numClick, ),
                    key(data: "-",fillColor: 0XFFFFA500,callback: numClick)
                  ],),
             Row(
              children: [
                    key(data: "1",callback: numClick, ),
                    key(data: "2",callback: numClick, ),
                    key(data: "3",callback: numClick, ),
                    key(data: "+",fillColor: 0XFFFFA500,callback: numClick )
                  ],) ,
             Row(
              children: [
                    key(data: ".",callback: numClick, ),
                    key(data: "0",callback: numClick, ),
                    key(data: "00",callback: numClick, ),
                    key(data: "=",fillColor: 0XFFFFA500,callback: evaluate )
                  ],)            
        ],
        ),
      ),
      
    );
  }
}


