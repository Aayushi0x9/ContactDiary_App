import 'dart:io';

import 'package:contact_dairy_app/controller/addcontact_controller.dart';
import 'package:contact_dairy_app/exe.dart';
import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  TextEditingController ftnameController = TextEditingController();
  TextEditingController sdnameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  // String? path;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    AddcontactController addContactProvider =
        Provider.of<AddcontactController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(backgroundColor: Colors.transparent),
          child: const Text(
            'Cancel',
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              color: CupertinoColors.activeBlue,
            ),
          ),
        ),
        title: const Text(
          'New Contact',
          style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              addContactProvider.addContact(Contact(
                ftname: ftnameController.text,
                sdname: sdnameController.text,
                number: numberController.text,
                email: emailController.text,
                company: companyController.text,
                imagePath: addContactProvider.path,
              ));
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(backgroundColor: Colors.transparent),
            child: const Text(
              'Save',
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: CupertinoColors.activeBlue,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  addContactProvider.path == null
                      ? const CircleAvatar(
                          radius: 60,
                        )
                      : CircleAvatar(
                          foregroundImage:
                              FileImage(File(addContactProvider.path!)),
                          radius: 60,
                        ),
                  FloatingActionButton.small(
                    onPressed: () async {
                      ImagePicker picker = ImagePicker();
                      XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        addContactProvider.path =
                            image.path; // Update the image path in provider
                      }
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
              10.h,
              TextButton(
                onPressed: () async {
                  ImagePicker picker = ImagePicker();
                  XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  addContactProvider.path = image!.path;
                },
                child: const Text('Edit'),
              ),
              20.h,
              TextFormField(
                style: const TextStyle(fontFamily: 'SF Pro'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                controller: ftnameController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                  labelText: 'First Name',
                  labelStyle: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextFormField(
                style: const TextStyle(fontFamily: 'SF Pro'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                controller: sdnameController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Last Name',
                  labelStyle: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // 5.h,
              // TextFormField(
              //   textInputAction: TextInputAction.next,
              //   keyboardType: TextInputType.phone,
              //   controller: addContactProvider.numberController,
              //   decoration: const InputDecoration(
              //     prefixIcon: Icon(Icons.phone),
              //     filled: true,
              //     fillColor: Colors.white,
              //     labelText: 'Number',
              //     labelStyle: TextStyle(
              //       fontFamily: 'SF Pro',
              //       fontSize: 16,
              //       fontWeight: FontWeight.w400,
              //     ),
              //     hintText: '+91 1234567890',
              //     hintStyle: TextStyle(
              //       fontFamily: 'SF Pro',
              //       fontSize: 16,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                controller: companyController,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.add_business),
                  fillColor: Colors.white,
                  labelText: 'Company',
                  labelStyle: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              30.h,
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                controller: numberController,
                decoration: const InputDecoration(
                  filled: true,
                  suffixIcon: Icon(Icons.phone),
                  prefixIcon: Icon(
                    Icons.add_circle,
                    color: CupertinoColors.systemGreen,
                  ),
                  fillColor: Colors.white,
                  labelText: 'Number',
                  hintText: '+91 0123456789',
                  labelStyle: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              30.h,
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  filled: true,
                  suffixIcon: Icon(Icons.email),
                  prefixIcon: Icon(
                    Icons.add_circle,
                    color: CupertinoColors.systemGreen,
                  ),
                  fillColor: Colors.white,
                  labelText: 'Email',
                  hintText: 'xyz@gmail.com',
                  labelStyle: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              20.h,

              ElevatedButton(
                onPressed: () {
                  ftnameController.clear();
                  sdnameController.clear();
                  companyController.clear();
                  numberController.clear();
                  emailController.clear();
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
