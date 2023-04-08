import 'package:flutter/material.dart';
import 'package:my_test/main.dart';
import 'package:my_test/home.dart';
class negativeResult extends StatefulWidget {
  const negativeResult({super.key});

  @override
  State<negativeResult> createState() => _negativeResultState();
}

class _negativeResultState extends State<negativeResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 216, 162, 233),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 110, 67, 131),
          title: Text("Result", style: TextStyle(
              fontFamily: 'Montserrat')),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                const Text(
                  "Oops! It seems like you have Insomnia!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 95, 47, 92),
                  ),
                ),
                SizedBox(height: 25.0),
                Image.asset('assets/images/ill2.png',
                  width: 170,
                ),
                SizedBox(height: 25.0),
                const Text(
                  "Based on your answers, it appears that you may be suffering from insomnia. We recommend that you take a clinical diagnosis.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 35.0),
                Container(
                  margin: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Text(
                      'Back to Home page',
                      style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Montserrat',),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 40),
                        backgroundColor: Color.fromARGB(255, 95, 47, 92),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),

              ],

            )


        ));
  }}