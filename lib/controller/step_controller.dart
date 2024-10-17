import 'package:flutter/material.dart';

class StepperProvider extends ChangeNotifier {
  int currentStep = 0;
  String? path;
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void nextStep() {
    if (currentStep < 3) {
      currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      currentStep--;
      notifyListeners();
    }
  }

  void saveData() {
    // Handle the save logic here
    print('path : $path');
    print("Name: ${nameController.text}");
    print("Contact: ${contactController.text}");
    print("Email: ${emailController.text}");
  }
}
