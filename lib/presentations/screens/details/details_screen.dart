import 'dart:io';

import 'package:contact_dairy_app/controller/contact_controller.dart';
import 'package:contact_dairy_app/exe.dart';
import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
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
    ContactController hideController = Provider.of<ContactController>(context);
    ContactController contactController =
        Provider.of<ContactController>(context);
    TextEditingController ftnameController = TextEditingController();
    TextEditingController sdnameController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController companyController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
              onPressed: () {
                // addcontactController.selectedIndex = index;
                ftnameController = TextEditingController(text: contact.ftname);
                sdnameController = TextEditingController(text: contact.sdname);
                numberController = TextEditingController(text: contact.number);
                emailController = TextEditingController(text: contact.email);
                companyController =
                    TextEditingController(text: contact.company);
                editDailogue(
                    context,
                    ftnameController,
                    sdnameController,
                    emailController,
                    companyController,
                    numberController,
                    contact,
                    contactController);
              },
              // addcontactController.updateContact(contact);
              icon: const Icon(Icons.edit_outlined)),
          IconButton(
            onPressed: () {
              if (hideController.hideList.contains(contact)) {
                hideController.unHideContact(contact);

                Navigator.pop(context);
              } else {
                hideController.hideContact(contact);
                contactController.removeContact(contact);
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.lock_outline),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            contact.imagePath == null
                ? CircleAvatar(
                    radius: 50,
                    child: Text(
                      contact.ftname[0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SF Pro',
                      ),
                    ))
                : CircleAvatar(
                    radius: 50,
                    foregroundImage: FileImage(File(contact.imagePath!)),
                  ),
            10.h,
            Text(
              contact.ftname + ' ',
              style: const TextStyle(
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
                    const Text('Call'),
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
                    const Text('Message'),
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
                          Share.share(contact.number);
                        },
                        icon: Icon(Icons.share)),
                    10.h,
                    const Text('Share'),
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
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(FontAwesomeIcons.whatsapp),
                  10.w,
                  const Text(
                    'WhatsApp',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            10.h,
            ListTile(
              leading: SizedBox(),
              trailing: const Icon(FontAwesomeIcons.whatsapp),
              title: Text('Message +91 ${contact.number}'),
            ),
            ListTile(
              leading: SizedBox(),
              trailing: const Icon(FontAwesomeIcons.whatsapp),
              title: Text('Voice call +91 ${contact.number}'),
            ),
            ListTile(
              leading: SizedBox(),
              trailing: const Icon(FontAwesomeIcons.whatsapp),
              title: Text('Video call +91 ${contact.number}'),
            )
          ],
        ),
      ),
    );
  }

  void editDailogue(
      BuildContext context,
      TextEditingController ftnameController,
      TextEditingController sdnameController,
      TextEditingController emailController,
      TextEditingController companyController,
      TextEditingController numberController,
      Contact contact,
      ContactController contactController) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              style: const TextStyle(fontFamily: 'SF Pro'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              controller: ftnameController,
              decoration: const InputDecoration(
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
                prefixIcon: Icon(Icons.person),
                labelText: 'Last Name',
                labelStyle: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                ),
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
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              controller: companyController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.add_business),
                labelText: 'Company',
                labelStyle: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              controller: numberController,
              maxLength: 10,
              decoration: const InputDecoration(
                // filled: true,
                prefixIcon: Icon(
                  Icons.phone,
                  color: CupertinoColors.systemGreen,
                ),
                // fillColor: Colors.white,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                ElevatedButton(
                  onPressed: () {
                    contact.ftname = ftnameController.text;
                    contact.sdname = sdnameController.text;
                    contact.number = numberController.text;
                    contact.email = emailController.text;
                    contact.company = companyController.text;
                    contactController.updateContact(contact);

                    Navigator.pop(context);
                  },
                  child: const Text('Update'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
