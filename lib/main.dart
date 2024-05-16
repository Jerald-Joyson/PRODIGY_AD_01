import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:myapp/widgets/CalcButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF283637),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFF545F61),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'C',
                    fillColor: 0xFF6C807F,
                    callback: allClear,
                  ),
                  CalcButton(
                    text: '⟨',
                    fillColor: 0xFF6C807F,
                    callback: clear,
                  ),
                  CalcButton(
                    text: '%',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '/',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '8',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '9',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '*',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 24,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '5',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '6',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 38,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '2',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '3',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '+',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    textSize: 30,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '.',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '0',
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '^',
                    callback: numClick,
                    textSize: 26,
                  ),
                  CalcButton(
                    text: '=',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xFF65BDAC,
                    callback: evaluate,
                  ),
                ],
              )
            ],
          ),
        ),
      );
  }
}
