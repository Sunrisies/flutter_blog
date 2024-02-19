import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'guess_app_bar.dart';
import 'result_notice.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key, required this.title});
  final String title;

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  int _value = 0;
  bool? _isBig;
  int _isShow = 1;
  Random _random = Random();
  bool _guessing = false;
  void _generateRandomValue() {
    setState(() {
      _guessing = true;
      _value = _random.nextInt(100);
    });
  }

  TextEditingController _guessCtrl = TextEditingController();

  void _onCheck() {
    print('======1=======${_guessCtrl.text}:${_value}');
    int? guessValue = int.tryParse(_guessCtrl.text);
    if (!_guessing || guessValue == null) return;
    if (guessValue == _value) {
      setState(() {
        _isShow = 1;
        print("_isShow:${_isShow}");
        _isBig = null;
        _guessing = false;
      });
    }
    if (guessValue > _value) {
      setState(() {
        _isShow = 2;
        print("2_isShow:${_isShow}");
        _isBig = guessValue > _value;
      });
    }
    if (guessValue < _value) {
      setState(() {
        _isShow = 3;
        print("3_isShow:${_isShow}");

        _isBig = guessValue > _value;
      });
    }
    // setState(() {
    //   _isShow = 2;
    //   _isBig = guessValue > _value;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuessAppBar(
        onCheck: _onCheck,
        controller: _guessCtrl,
      ),
      body: Stack(
        children: [
          if(_isBig!=null)
          Column(
            children: [
              if(_isShow == 1)
              ResultNotice(color: Colors.transparent, info: ''),
              Spacer(),
              if(_isShow == 2)
              ResultNotice(color: Colors.redAccent, info: '大了'),
              Spacer(),
              if(_isShow == 3)
              ResultNotice(color: Colors.blueAccent, info: '小了'),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!_guessing)
                  const Text(
                    '点击生成随机数值',
                  ),
                Text(
                  _guessing ? '**' : '$_value',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomValue,
        tooltip: 'Increment',
        child: const Icon(Icons.generating_tokens_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
