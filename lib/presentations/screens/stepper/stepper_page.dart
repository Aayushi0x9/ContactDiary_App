import 'dart:io';

import 'package:contact_dairy_app/controller/step_controller.dart';
import 'package:contact_dairy_app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<StepperProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ContactApp',
          style: TextStyle(),
        ),
      ),
      backgroundColor: CupertinoColors.secondarySystemBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stepper(
              currentStep: stepperProvider.currentStep,
              onStepContinue: stepperProvider.nextStep,
              onStepCancel: stepperProvider.previousStep,
              steps: [
                Step(
                  title: const Text('Profile'),
                  content: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          stepperProvider.path == null
                              ? const CircleAvatar(
                                  radius: 60,
                                )
                              : CircleAvatar(
                                  foregroundImage:
                                      FileImage(File(stepperProvider.path!)),
                                  radius: 60,
                                ),
                          FloatingActionButton.small(
                            onPressed: () async {
                              ImagePicker picker = ImagePicker();
                              XFile? image = await picker.pickImage(
                                  source: ImageSource.gallery);
                              stepperProvider.path = image!.path;
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hoverColor: Colors.blue,
                            splashColor: Colors.green,
                            child: const Icon(Icons.add_a_photo_outlined),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Step(
                  title: const Text('Name & Contact'),
                  content: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.name,
                        showCursor: true,
                        textInputAction: TextInputAction.next,
                        controller: stepperProvider.nameController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(20),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            label: const Text('Name'),
                            hintText: 'Enter Name',
                            hintStyle: TextStyle(
                              fontSize: 14,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: stepperProvider.contactController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(20),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            label: const Text('Contact Number'),
                            hintText: 'Enter Contact Number',
                            hintStyle: TextStyle(
                              fontSize: 14,
                            )),
                      ),
                    ],
                  ),
                ),
                Step(
                  title: const Text('Email'),
                  content: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: stepperProvider.emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(20),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          label: const Text('Email'),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Step(
                  title: const Text('Save'),
                  content: ElevatedButton(
                    onPressed: stepperProvider.saveData,
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.counterPage);
            },
            child: const Text('Counter'),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.addContactPage);
            },
            child: const Text('Add contact page'),
          ),
        ],
      ),
    );
  }
}
