import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magic Ball',
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Magic Ball',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: const QuestionGame(),
      ),
    );
  }
}

class QuestionGame extends StatefulWidget {
  const QuestionGame({Key? key}) : super(key: key);

  @override
  State<QuestionGame> createState() => _QuestionGameState();
}

class _QuestionGameState extends State<QuestionGame> {
  int randomNum = 1;
  void randomNumGen() {
    randomNum = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Flexible>[
        Expanded(
          flex: 4,
          child: Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  randomNumGen();
                  if (kDebugMode) {
                    print('Pressed image, random num is $randomNum');
                  }
                });
              },
              child: Image.asset(
                'images/ball$randomNum.png',
              ),
            ),
          ),
        ),
        const Expanded(
          child: Text(
            'Ask Me Anything',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Inspiration',
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
