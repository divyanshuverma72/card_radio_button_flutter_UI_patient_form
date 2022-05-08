class SingletonModal {
  static final SingletonModal _singleton = SingletonModal._internal();

  factory SingletonModal() {
    return _singleton;
  }

  SingletonModal._internal();

  String patientId = "";
  String aadharId = "";
  String name = "";
  String phoneNumber = "";
  String emailId = "";
  String age = "";
  String gender = "";
  String caste = "";
  String waterSource = "";
  String isSmoker = "";
  String isAlcoholic = "";
  String height = "";
  String weight = "";
  String systolic = "";
  String diastolic = "";
  String bp = "";
  String medicalHistory = "";
  String symptoms = "";
}