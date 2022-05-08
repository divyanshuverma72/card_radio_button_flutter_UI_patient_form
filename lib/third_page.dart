import 'package:flutter/material.dart';
import 'package:patient_form/singleton_modal.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SingletonModal singletonModal = SingletonModal();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Third page"),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                addResult("Patient Id", singletonModal.patientId),
                addResult("Aadhar Id", singletonModal.aadharId),
                addResult("Name", singletonModal.name),
                addResult("Phone number", singletonModal.phoneNumber),
                addResult("Email Id", singletonModal.emailId),
                addResult("Age", singletonModal.age),
                addResult("Gender", singletonModal.gender),
                addResult("Caste", singletonModal.caste),
                addResult("Drinking water resource", singletonModal.waterSource),
                addResult("Smoker", singletonModal.isSmoker),
                addResult("Alcoholic", singletonModal.isAlcoholic),
                addResult("Height", singletonModal.height),
                addResult("Weight", singletonModal.weight),
                addResult("Systolic", singletonModal.systolic),
                addResult("Diastolic", singletonModal.diastolic),
                addResult("Categorical Blood Pressure", singletonModal.bp),
                addResult("Medical History (Affected Organs)", singletonModal.medicalHistory),
                addResult("Symptoms", singletonModal.symptoms),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding addResult(String field, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(field), Text(value)],
      ),
    );
  }
}
