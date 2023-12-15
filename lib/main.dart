import 'package:flutter/material.dart';
import 'Person.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var weightController= TextEditingController();
  var heightController= TextEditingController();
  var keyForm = GlobalKey<FormState>();
  var msg = "Report your data!";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("BMI Calculator App"),
            ),
          ),


          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 100,
                  ),
                  Form(
                      key: keyForm,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val){
                              if(val!.isEmpty) return "Please enter your weight";
                            },




                            controller: weightController,
                            decoration: InputDecoration(
                                labelText: "Weight in (Kg)",
                                labelStyle: TextStyle(color: Colors.blue)),
                          ),
                          SizedBox(
                            height: 20,
                            width: 20,
                          ),
                          TextFormField(
                            validator: (val){
                              if(val!.isEmpty) return "Please enter your size";
                            },




                            controller: heightController,
                            decoration: InputDecoration(
                                labelText: "Size in (Cm)",
                                labelStyle: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () {
                        if(keyForm.currentState!.validate()){
                          var persone1 = Person(weight: double.parse(weightController.text) , height: double.parse(heightController.text));
                          var imc = persone1.calculerImc();
                          setState(() {
                            msg = "BMI $imc: ${persone1.getMessage(imc)}";
                          });
                        }
                      },
                      child: const Text(
                        "Calculate!",
                        style: TextStyle(color: Colors.blue),
                      )),
                  Text(msg,
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
            ),
          )),
    );throw UnimplementedError();
  }
}
