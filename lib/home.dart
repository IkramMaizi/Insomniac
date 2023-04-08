import 'package:my_test/longTest.dart';
import 'package:my_test/positiveResult.dart';
import 'package:my_test/negativeResult.dart';
import 'package:my_test/shortTest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover)),
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Insomniac',
                style: TextStyle(
                    fontFamily: 'Signatra', fontSize: 80, color: Colors.white)),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 60),
              child: Text(
                  'Insomniac is a user-friendly tool designed to help individuals with the diagnosis of insomnia.\nThe app features a collection of questions and utilizes ML algorithms to analyze the responses to the questions and provide a personalized assessment of the likelihood of an individual having insomnia.\nInsomniac offers two testing options to aid in th diagosis of insomnia: a long test and a short test',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      color: Colors.white)),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: GlowButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShortTest()));
                },
                child: Text(
                  'TAKE THE SHORT TEST',
                  style: TextStyle(color: Color.fromARGB(255, 50, 27, 59) , fontSize: 13, fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                ),
                color: Colors.yellow[100],
                width: 230,
                height: 40,
                spreadRadius: 0.1,
                padding: EdgeInsets.all(5),
                glowColor: Colors.yellow[100],


              ),
            ),
            Container(
              margin: EdgeInsets.all(14),
              child: GlowButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LongTest()));
                },
                child: Text(
                  'TAKE THE LONG TEST',
                  style: TextStyle(color: Color.fromARGB(255, 50, 27, 59) , fontSize: 13, fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                ),
                color: Colors.yellow[100],
                width: 230,
                height: 40,
                spreadRadius: 0.1,
                padding: EdgeInsets.all(5),
                glowColor: Colors.yellow[100],
                splashColor: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
