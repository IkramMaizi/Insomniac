import 'package:flutter/material.dart';
import 'package:my_test/negativeResult.dart';
import 'package:my_test/positiveResult.dart';
import 'package:sklite/naivebayes/naive_bayes.dart';
import 'package:sklite/utils/io.dart';
import 'dart:convert';

class ShortTest extends StatefulWidget {
  const ShortTest({super.key});

  @override
  State<ShortTest> createState() => _ShortTestState();
}

class _ShortTestState extends State<ShortTest> {
  GaussianNB nbc= new GaussianNB([0.5, 0.5], [[0.2472299179229571, 0.2029085882830678, 0.3829639899451175, 0.9168975079506576, 0.6710526326043975, 0.4598337960393006, 0.5491689760947024], [0.9314404442387467, 0.8698060952082757, 1.1779778403606307, 0.6987534636293283, 1.0886426603052284, 0.8254847655683865, 1.0221606658453943]],[[0.4473684210526316, 0.18421052631578946, 0.34210526315789475, 1.631578947368421, 0.5, 0.47368421052631576, 0.7631578947368421], [1.5526315789473684, 0.8421052631578947, 0.9210526315789473, 2.3421052631578947, 1.263157894736842, 1.263157894736842, 1.631578947368421]], [0, 1]);
  _ShortTestState(){
     //loadModel("assets/nb_model.json").then((x) {
     //nbc = GaussianNB.fromMap(json.decode(x));
  //});
}

  int _currentIndex = 0;
  final List<Map<String, dynamic>> _questions = [
  {
  "question": "How much do you experience difficulty falling asleep",
  "type": "options",
  "options": ["None", "Mild", "Moderate", "Severe", "Very severe"]
},
{
"question": "How much do you experience difficulty staying asleep",
"type": "options",
"options": ["None", "Mild", "Moderate", "Severe", "Very severe"]
},
{
"question": "How much do you experience problems waking up too early",
"type": "options",
"options": ["None", "Mild", "Moderate", "Severe", "Very severe"]
},
{
"question":
"How satisfied/dissatisfied are you with your current sleep pattern?",
"type": "options",
"options": ["Very Satisfied", "Satisfied", "Moderately Satisfied", "Dissatisfied Very Dissatisfied"]
},
{
"question":
"How noticeable to others do you think your sleep problem is in terms of impairing the quality of your life?",
"type": "options",
"options": ["Not Noticeable at all", "A Little", "Somewhat", "Much", "Very Much Noticeable"]
},
{
"question":
"How worried/distressed are you about your current sleep problem?",
"type": "options",
"options": ["Not worried at all", "A Little", "Somewhat", "Much", "Very Much worried"]
},

{
"question":
"To what extent do you consider your sleep problem to interfere with your daily functioning (e.g. daytime fatigue, ability to function at work/daily chores)?",
"type": "options",
"options": ["Not Interfering at all", "A Little", "Somewhat", "Much", "Very Much Interfering"]
},];
  Map<int, int> _answers = {};

  void _handleOptionSelected(int? value) {
    setState(() {
     int v= value ?? 0;
      _answers[_currentIndex] = v;
    //  if (_currentIndex < _questions.length - 1) {
     //   _currentIndex++;
    //  } else {
        // Enable the "Show Result" button when all questions have been answered
     //   _showResultButtonEnabled = true;
     // }
    });
  }

  bool _showResultButtonEnabled = false;
  Map<String, dynamic> model={};
  List <double> list=[];
  void _handleShowResultPressed() async {
    // TODO: Navigate to results page or calculate results
    //await loadModel("assets/nb_model.json").then((x) {
    //  model = json.decode(x);});
    //list= model['class_prior_'].map((e) => double.parse(e)).toList();
    //GaussianNB nbc= new GaussianNB(list  ,model['sigma_'],model['theta_'],model['classes']);

    // Determine if the user is an insomniac based on the total score
    List<double?> ans=[0,0,0,0,0,0,0] ;
    bool isInsomniac ;
    for (int i=0 ; i<7 ; i++){
    ans[i]=_answers[i]?.toDouble() ;}
    print(ans);
    int result = nbc.predict(ans);
    print(result);
    if(result==0){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => positiveResult()));
    }else{
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => negativeResult()));
    }
    // Show a dialog with the result

  }
  void _handleRestartPressed() {
    setState(() {
      if (_currentIndex < _questions.length - 1) {
           _currentIndex++;
          } else {
        // Enable the "Show Result" button when all questions have been answered
           _showResultButtonEnabled = true;
         }
      //_answers.clear();
     // _currentIndex = 0;
      //_showResultButtonEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 110, 67, 131),
        title: Text("Short Test"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 30,10, 0),
        color: Color.fromARGB(255, 216, 162, 233),
       // decoration: const BoxDecoration(
           // image: DecorationImage(
                //image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover)),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 200, 142, 213),
              ),
                padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                child: Column(
              children: [
                 Text(
                  "Question ${_currentIndex + 1}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  color: Colors.black
              ),
            ),
                 SizedBox(height: 8.0),
                 Text(
                _questions[_currentIndex]["question"],
                textAlign: TextAlign.start,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 17.0, color: Colors.black),
            ),
            SizedBox(height: 16.0)])),
            Column(
              children: (_questions[_currentIndex]["options"] as List<String>)
                  .asMap()
                  .entries
                  .map(
                    (entry) => Material(
                      child: RadioListTile<int>(
                        tileColor: Color.fromARGB(255, 216, 162, 233),
                        activeColor: Color.fromARGB(255, 110, 67, 131),

                        title: Text(entry.value ,style: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
                        value: entry.key + 1,
                        groupValue: _answers[_currentIndex],
                        onChanged: _handleOptionSelected,
                      ),
                    )
              )
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 30),
                      fixedSize: Size(100, 30),
                      backgroundColor: Color.fromARGB(255, 110, 67, 131),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text("Next", style: TextStyle(fontFamily: 'Montserrat')),
                  onPressed: _handleRestartPressed,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 30),
                      fixedSize: Size(100, 30),
                      backgroundColor: Color.fromARGB(255, 110, 67, 131),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text("Show Result", style: TextStyle(fontFamily: 'Montserrat'),),
                  onPressed: _showResultButtonEnabled
                      ? _handleShowResultPressed
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
