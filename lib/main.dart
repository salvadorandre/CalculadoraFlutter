import 'package:calculadora_1/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _history  = ""; 
  String _expresion = ""; 

  void allClear(String text) { 
    setState(() {
      _history = ""; 
      _expresion = ""; 
    });
  }

  void clear() {
    setState(() {
      _history = ''; 
      _expresion = ''; 
    });
  }

  void evaluate(String text) { 
    Parser p = Parser(); 
    Expression exp = p.parse(_expresion); 
    ContextModel cm = ContextModel(); 
    setState(() {
      _history = _expresion; 
      _expresion = exp.evaluate(EvaluationType.REAL, cm).toStringAsFixed(4);
    });
  }

  void numberClick(String text) { 
    setState(() {
      _expresion+=text; 
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: Scaffold(
        backgroundColor: const Color(0x00000),
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(1.0, 1.0),
                child:  Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(_history, style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 128, 126, 126)),),
                ),
              ), 

              Container(
                alignment: const Alignment(1.0, 1.0),
                child:  Padding( 
                  padding: const EdgeInsets.all(12.0),
                  child: (
                    Text(_expresion, style: const TextStyle(fontSize: 50, color: Colors.white),)
                  ),
                ),
              ), 

              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "AC",
                    callback: allClear,
                    textSize: 20,
                    color: 0xFF9B9B9B ,
                    widthButton: 75,
                  ), 
                  CalcButton( 
                    text: "C",
                    callback: clear,
                    textSize: 20,
                    color: 0XFF9B9B9B ,
                     widthButton: 75,
                  ), 

                  CalcButton( 
                    text: "%",
                    callback: numberClick,
                    textSize: 20,
                    color: 0XFF9B9B9B,
                     widthButton: 75,
                  ),
                   CalcButton( 
                    text: "/",
                    callback: numberClick,
                    textSize: 20,
                    color: 0xFFFFC300,
                     widthButton: 75,
                  ),

                ],
              ), 

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   CalcButton(
                    text: "7",
                    callback: numberClick,
                    textSize: 20.0,
                    color: 0xFF9B9B9B ,
                     widthButton: 75,
                  ), 
                  CalcButton( 
                    text: "8",
                    callback: numberClick,
                    textSize: 20,
                    color: 0XFF9B9B9B ,
                     widthButton: 75,
                  ), 

                  CalcButton( 
                    text: "9",
                    callback: numberClick,
                    textSize: 20,
                    color: 0XFF9B9B9B,
                     widthButton: 75,
                  ),
                   CalcButton( 
                    text: "*",
                    callback: numberClick,
                    textSize: 20,
                    color: 0xFFFFC300,
                     widthButton: 75,
                  ),

                ],
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   CalcButton(
                    text: "4",
                    callback: numberClick,
                    textSize: 20.0,
                    color: 0xFF9B9B9B ,
                     widthButton: 75,
                  ), 
                  CalcButton( 
                    text: "5",
                    callback: numberClick,
                    textSize: 20,
                    color: 0XFF9B9B9B ,
                     widthButton: 75,
                  ), 

                  CalcButton( 
                    text: "6",
                    callback: numberClick,
                    textSize: 20,
                    color: 0XFF9B9B9B,
                     widthButton: 75,
                  ),
                   CalcButton( 
                    text: "-",
                    callback: numberClick,
                    textSize: 20,
                    color: 0xFFFFC300,
                     widthButton: 75,
                  ),

                ],
              ), 

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   CalcButton(
                    text: "1",
                    callback: numberClick,
                    textSize: 20.0,
                    color: 0xFF9B9B9B ,
                     widthButton: 75,
                  ), 
                  CalcButton( 
                    text: "2",
                    callback: numberClick,
                    textSize: 20,
                    color: 0XFF9B9B9B ,
                     widthButton: 75,
                  ), 

                  CalcButton( 
                    text: "3",
                    callback: numberClick,
                    textSize: 20,
                    color: 0XFF9B9B9B,
                     widthButton: 75,
                  ),
                   CalcButton( 
                    text: "+",
                    callback: numberClick,
                    textSize: 20,
                    color: 0xFFFFC300,
                     widthButton: 75,
                  ),

                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   CalcButton(
                    text: "0",
                    callback: numberClick,
                    textSize: 20.0,
                    color: 0xFF9B9B9B ,
                     widthButton: 174,
                  ), 
                  CalcButton( 
                    text: ".",
                    callback: numberClick,
                    textSize: 20,
                    color: 0XFF9B9B9B ,
                     widthButton: 75,
                  ), 

                   CalcButton( 
                    text: "=",
                    callback: evaluate,
                    textSize: 20,
                    color: 0xFFFFC300,
                     widthButton: 75,
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
