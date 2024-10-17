import 'dart:io';

import 'package:contact_dairy_app/controller/addcontact_controller.dart';
import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:contact_dairy_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AddcontactController contactProvider =
        Provider.of<AddcontactController>(context);
    TextEditingController ftnameController = TextEditingController();
    TextEditingController sdnameController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController companyController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Diary'),
      ),
      body: contactProvider.contacts.isEmpty
          ? Center(child: Text('No contacts yet'))
          : ListView.separated(
              itemCount: contactProvider.contacts.length,
              itemBuilder: (context, index) {
                Contact contact = contactProvider.contacts[index];
                ftnameController = TextEditingController(text: contact.ftname);
                sdnameController = TextEditingController(text: contact.sdname);
                numberController = TextEditingController(text: contact.number);
                emailController = TextEditingController(text: contact.email);
                companyController =
                    TextEditingController(text: contact.company);

                return Slidable(
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                          backgroundColor: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          icon: Icons.delete,
                          label: 'Delete',
                          foregroundColor: Colors.white,
                          onPressed: (context) {
                            contactProvider.deleteContac(index);
                          }),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.detailsPage,
                          arguments: contact);
                    },
                    child: ListTile(
                      leading: contact.imagePath != null
                          ? CircleAvatar(
                              backgroundImage:
                                  FileImage(File(contact.imagePath!)),
                            )
                          : CircleAvatar(
                              child: Text(contact.ftname[0].toUpperCase())),
                      title: Text(contact.ftname),
                      subtitle: Text(contact.number),
                      trailing: IconButton(
                        onPressed: () {
                          contactProvider.selectedIndex = index;
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
                                          contactProvider
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
                        icon: Icon(Icons.edit),
                      ),
                      onTap: () {
                        // Handle tap to view details
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addContactPage);
        },
        icon: const Icon(Icons.add),
        label: const Text('Add contact'),
      ),
    );
  }
}
