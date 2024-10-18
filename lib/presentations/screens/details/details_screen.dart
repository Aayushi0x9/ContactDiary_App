import 'dart:io';

import 'package:contact_dairy_app/controller/addcontact_controller.dart';
import 'package:contact_dairy_app/exe.dart';
import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;
    AddContactController hideController =
        Provider.of<AddContactController>(context);
    AddContactController addcontactController =
        Provider.of<AddContactController>(context);
    TextEditingController ftnameController = TextEditingController();
    TextEditingController sdnameController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController companyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
              onPressed: () {
                hideController.hideContact(contact);
                addcontactController.removeContact(contact);
                Navigator.pop(context);
              },
              icon: Icon(Icons.lock_outline))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              foregroundImage: FileImage(File(contact.imagePath ?? '')),
            ),
            10.h,
            Text(
              contact.ftname + ' ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontFamily: 'SF Pro',
              ),
            ),
            30.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        padding:
                            const WidgetStatePropertyAll(EdgeInsets.all(15)),
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.grey.shade300),
                      ),
                      onPressed: () async {
                        Uri call = Uri(scheme: 'tel', path: contact.number);
                        await launchUrl(call);
                      },
                      icon: const Icon(
                        Icons.wifi_calling_3_outlined,
                        color: Colors.black87,
                      ),
                    ),
                    10.h,
                    Text('Call'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        padding:
                            const WidgetStatePropertyAll(EdgeInsets.all(15)),
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.grey.shade300),
                      ),
                      onPressed: () async {
                        Uri sms = Uri(scheme: 'sms', path: contact.number);
                        await launchUrl(sms);
                      },
                      icon: const Icon(Icons.message_outlined),
                    ),
                    10.h,
                    Text('Message'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        style: ButtonStyle(
                          padding:
                              const WidgetStatePropertyAll(EdgeInsets.all(15)),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.grey.shade300),
                        ),
                        onPressed: () {
                          // addcontactController.selectedIndex = index;
                          ftnameController =
                              TextEditingController(text: contact.ftname);
                          sdnameController =
                              TextEditingController(text: contact.sdname);
                          numberController =
                              TextEditingController(text: contact.number);
                          emailController =
                              TextEditingController(text: contact.email);
                          companyController =
                              TextEditingController(text: contact.company);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Update Contact'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: ftnameController,
                                  ),
                                  TextField(
                                    controller: sdnameController,
                                  ),
                                  TextField(
                                    controller: emailController,
                                  ),
                                  TextField(
                                    controller: companyController,
                                  ),
                                  TextField(
                                    controller: numberController,
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel')),
                                      ElevatedButton(
                                        onPressed: () {
                                          contact.ftname =
                                              ftnameController.text;
                                          contact.sdname =
                                              sdnameController.text;
                                          contact.number =
                                              numberController.text;
                                          contact.email = emailController.text;
                                          contact.company =
                                              companyController.text;
                                          addcontactController
                                              .updateContact(contact);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Update'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        // addcontactController.updateContact(contact);
                        icon: Icon(Icons.edit_outlined)),
                    10.h,
                    Text('Edit'),
                  ],
                ),
              ],
            ),
            20.h,
            const Divider(),
            10.h,
            ListTile(
              leading: const Icon(Icons.call_outlined),
              title: Text(contact.number),
              subtitle: Text(contact.email ?? ''),
              trailing: IconButton(
                onPressed: () async {
                  Uri email = Uri(scheme: 'mailto', path: contact.email);
                  await launchUrl(email);
                },
                icon: const Icon(Icons.mail_outline),
              ),
            ),
            10.h,
            const Divider(),
            10.h,
          ],
        ),
      ),
    );
  }
}
