import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:patient_form/singleton_modal.dart';
import 'package:patient_form/third_page.dart';

import 'constants.dart';

class SecondPage extends StatefulWidget {
  static const String id = 'second_page';

  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  List<RadioModel> casteData = <RadioModel>[];
  List<RadioModel> waterSource = <RadioModel>[];
  List<RadioModel> bp = <RadioModel>[];
  List<RadioModel> medicalHistory = <RadioModel>[];
  List<RadioModel> symptoms = <RadioModel>[];

  SingletonModal singleTon = SingletonModal();
  bool isSmoker = false;
  bool isAlcoholic = false;
  bool tosAccepted = false;

  @override
  void initState() {
    super.initState();
    casteData.add(RadioModel(false, 'GEN'));
    casteData.add(RadioModel(false, 'SC'));
    casteData.add(RadioModel(false, 'ST'));
    casteData.add(RadioModel(false, 'OBC'));
    casteData.add(RadioModel(false, 'Others'));
    casteData.add(RadioModel(false, 'Prefer Not to Say'));

    waterSource.add(RadioModel(false, 'R.O'));
    waterSource.add(RadioModel(false, 'Natural'));
    waterSource.add(RadioModel(false, 'Government'));

    bp.add(RadioModel(false, 'High'));
    bp.add(RadioModel(false, 'Normal'));
    bp.add(RadioModel(false, 'Low'));
    bp.add(RadioModel(false, 'Unknown'));

    medicalHistory.add(RadioModel(false, "Kidney"));
    medicalHistory.add(RadioModel(false, "Heart"));
    medicalHistory.add(RadioModel(false, "Lung"));
    medicalHistory.add(RadioModel(false, "Brain"));
    medicalHistory.add(RadioModel(false, "Liver"));
    medicalHistory.add(RadioModel(false, "Other"));

    symptoms.add(RadioModel(false, "Menorrhagia"));
    symptoms.add(RadioModel(false, "Tiredness"));
    symptoms.add(RadioModel(false, "Calf Muscle Pain"));
    symptoms.add(RadioModel(false, "Worm infection"));
    symptoms.add(RadioModel(false, "Yellow Urine"));
    symptoms.add(RadioModel(false, "Stomach Pain"));
    symptoms.add(RadioModel(false, "Chest Pain"));
    symptoms.add(RadioModel(false, "Breathing issue"));
    symptoms.add(RadioModel(false, "Urinary frequency"));

    singleTon.isAlcoholic = "No";
    singleTon.isSmoker = "No";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Second page"),
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Center(
                    child: Text(
                  "Additional information",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Caste: (Optional)",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addCaste(0, casteData[0].buttonText),
                      addCaste(1, casteData[1].buttonText),
                      addCaste(2, casteData[2].buttonText)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addCaste(3, casteData[3].buttonText),
                      addCaste(4, casteData[4].buttonText),
                      addCaste(5, casteData[5].buttonText)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Drinking water source",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addWaterSource(0, waterSource[0].buttonText),
                      addWaterSource(1, waterSource[1].buttonText),
                      addWaterSource(2, waterSource[2].buttonText)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Smoker?"),
                      FlutterSwitch(
                        width: 60.0,
                        height: 30.0,
                        toggleSize: 25.0,
                        value: isSmoker,
                        borderRadius: 30.0,
                        padding: 1.0,
                        onToggle: (val) {
                          setState(() {
                            isSmoker = val;
                            if (isSmoker) {
                              singleTon.isSmoker = "Yes";
                            } else {
                              singleTon.isSmoker = "No";
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Alcoholic?"),
                      FlutterSwitch(
                        width: 60.0,
                        height: 30.0,
                        toggleSize: 25.0,
                        value: isAlcoholic,
                        borderRadius: 30.0,
                        padding: 1.0,
                        onToggle: (val) {
                          setState(() {
                            isAlcoholic = val;
                            if (isAlcoholic) {
                              singleTon.isAlcoholic = "Yes";
                            } else {
                              singleTon.isAlcoholic = "No";
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("Height? (cm)"),
                      Text("Weight? (kg)"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            singleTon.height = value;
                          },
                          decoration: textFieldDecoration.copyWith(
                            hintText: 'Height',
                          ),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Flexible(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            singleTon.weight = value;
                          },
                          decoration: textFieldDecoration.copyWith(
                            hintText: 'Weight',
                          ),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("Systolic? (mm Hg)"),
                      Text("Diastolic? (mm Hg)"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            singleTon.systolic = value;
                          },
                          decoration: textFieldDecoration.copyWith(
                            hintText: 'Systolic',
                          ),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Flexible(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            singleTon.diastolic = value;
                          },
                          decoration: textFieldDecoration.copyWith(
                            hintText: 'Diastolic',
                          ),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Categorical Blood Pressure?",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addBp(0, bp[0].buttonText),
                      addBp(1, bp[1].buttonText),
                      addBp(2, bp[2].buttonText),
                      addBp(3, bp[3].buttonText)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Medical History: (Affected Organs)",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addMedicalHistory(0, medicalHistory[0].buttonText),
                      addMedicalHistory(1, medicalHistory[1].buttonText),
                      addMedicalHistory(2, medicalHistory[2].buttonText)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addMedicalHistory(3, medicalHistory[3].buttonText),
                      addMedicalHistory(4, medicalHistory[4].buttonText),
                      addMedicalHistory(5, medicalHistory[5].buttonText)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Any Symptoms?",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addSymptoms(0, symptoms[0].buttonText),
                      addSymptoms(1, symptoms[1].buttonText),
                      addSymptoms(2, symptoms[2].buttonText)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addSymptoms(3, symptoms[3].buttonText),
                      addSymptoms(4, symptoms[4].buttonText),
                      addSymptoms(5, symptoms[5].buttonText)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addSymptoms(6, symptoms[6].buttonText),
                      addSymptoms(7, symptoms[7].buttonText),
                      addSymptoms(8, symptoms[8].buttonText)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: CheckboxListTile(
                        title: const Text(
                          "I agree to the",
                        ),
                        value: tosAccepted,
                        onChanged: (newValue) {
                          setState(() {
                            tosAccepted = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Terms of Use', style: TextStyle(color: Colors.red,),
                    )),
                  ],
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                const ThirdPage()));
                      },
                      child: const Text(
                        "Submit Patient",
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

  GestureDetector addCaste(int pos, String field) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (var element in casteData) {
            element.isSelected = false;
          }
          casteData[pos].isSelected = true;
          singleTon.caste = casteData[pos].buttonText;
        });
      },
      child: Container(
        width: 95,
        height: 38,
        decoration: BoxDecoration(
          color: casteData[pos].isSelected ? Colors.red[900] : Colors.grey[100],
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.all(10),
        // Change button text when light changes state.
        child: Center(child: Text(field, style: TextStyle(fontSize: pos == 5 ? 8 : null),)),
      ),
    );
  }
  GestureDetector addWaterSource(int pos, String field) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (var element in waterSource) {
            element.isSelected = false;
          }
          waterSource[pos].isSelected = true;
          singleTon.waterSource = waterSource[pos].buttonText;
        });
      },
      child: Container(
        width: 95,
        height: 38,
        decoration: BoxDecoration(
          color: waterSource[pos].isSelected ? Colors.red[900] : Colors.grey[100],
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.all(10),
        // Change button text when light changes state.
        child: Center(child: Text(field, style: TextStyle(fontSize: pos == 2 ? 12 : null),)),
      ),
    );
  }

  GestureDetector addBp(int pos, String field) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (var element in bp) {
            element.isSelected = false;
          }
          bp[pos].isSelected = true;
          singleTon.bp = bp[pos].buttonText;
        });
      },
      child: Container(
        width: 70,
        height: 38,
        decoration: BoxDecoration(
          color: bp[pos].isSelected ? Colors.red[900] : Colors.grey[100],
          borderRadius: BorderRadius.circular(5.0),
        ),
        // Change button text when light changes state.
        child: Center(child: Text(field)),
      ),
    );
  }

  GestureDetector addMedicalHistory(int pos, String field) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (var element in medicalHistory) {
            element.isSelected = false;
          }
          medicalHistory[pos].isSelected = true;
          singleTon.medicalHistory = medicalHistory[pos].buttonText;
        });
      },
      child: Container(
        width: 95,
        height: 38,
        decoration: BoxDecoration(
          color: medicalHistory[pos].isSelected ? Colors.red[900] : Colors.grey[100],
          borderRadius: BorderRadius.circular(5.0),
        ),
        // Change button text when light changes state.
        child: Center(child: Text(field)),
      ),
    );
  }

  GestureDetector addSymptoms(int pos, String field) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (var element in symptoms) {
            element.isSelected = false;
          }
          symptoms[pos].isSelected = true;
          singleTon.symptoms = symptoms[pos].buttonText;
        });
      },
      child: Container(
        width: 95,
        height: 38,
        decoration: BoxDecoration(
          color: symptoms[pos].isSelected ? Colors.red[900] : Colors.grey[100],
          borderRadius: BorderRadius.circular(5.0),
        ),
        // Change button text when light changes state.
        child: Center(child: Text(field, style: const TextStyle(fontSize: 10),)),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}
