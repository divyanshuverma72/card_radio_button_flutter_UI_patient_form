import 'package:flutter/material.dart';
import 'package:patient_form/second_page.dart';
import 'package:patient_form/singleton_modal.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Patient form'),
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
  List<RadioModel> genderData = <RadioModel>[];
  SingletonModal singleTon = SingletonModal();

  @override
  void initState() {
    super.initState();
    genderData.add(RadioModel(false, 'Male'));
    genderData.add(RadioModel(false, 'Female'));
    genderData.add(RadioModel(false, 'Trans'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/graphics.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    singleTon.patientId = value;
                  },
                  decoration: textFieldDecoration.copyWith(
                    hintText: 'Patient ID (If any)',
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    singleTon.aadharId = value;
                  },
                  decoration: textFieldDecoration.copyWith(
                    hintText: 'Aadhar ID',
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    singleTon.name = value;
                  },
                  decoration: textFieldDecoration.copyWith(
                    hintStyle: const TextStyle(color: Colors.red),
                    hintText: 'Name*',
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    singleTon.phoneNumber = value;
                  },
                  decoration: textFieldDecoration.copyWith(
                    hintStyle: const TextStyle(color: Colors.red),
                    prefixIcon: Image.asset("images/india.png"),
                    hintText: 'Phone Number*',
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    singleTon.emailId = value;
                  },
                  decoration: textFieldDecoration.copyWith(
                    hintText: 'Email ID',
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    singleTon.age = value;
                  },
                  decoration: textFieldDecoration.copyWith(
                    hintStyle: const TextStyle(color: Colors.red),
                    hintText: 'Age*',
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Gender*",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addGender(0, genderData[0].buttonText),
                      addGender(1, genderData[1].buttonText),
                      addGender(2, genderData[2].buttonText),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Material(
                    color: Colors.red[900],
                    borderRadius: BorderRadius.circular(15.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      height: 42.0,
                      onPressed: () {
                        if (singleTon.name.isEmpty) {
                          showError(context, "Name can not be empty");
                          return;
                        } else if (singleTon.phoneNumber.isEmpty) {
                          showError(context, "Phone number can not be empty");
                          return;
                        } else if (singleTon.age.isEmpty) {
                          showError(context, "Age can not be empty");
                          return;
                        } else if (singleTon.gender.isEmpty) {
                          showError(context, "Gender can not be empty");
                          return;
                        } else if (singleTon.name.isEmpty) {
                          showError(context, "Name can not be empty");
                          return;
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SecondPage()));
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  GestureDetector addGender(int pos, String gender) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (var element in genderData) {
            element.isSelected = false;
          }
          genderData[pos].isSelected = true;
          singleTon.gender = genderData[pos].buttonText;
        });
      },
      child: Container(
        width: 95,
        decoration: BoxDecoration(
          color: genderData[pos].isSelected ? Colors.red[900] : Colors.grey[100],
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.all(10),
        // Change button text when light changes state.
        child: Center(child: Text(gender)),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}
