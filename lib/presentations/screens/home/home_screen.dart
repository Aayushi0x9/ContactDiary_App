import 'dart:io';

import 'package:contact_dairy_app/controller/contact_controller.dart';
import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:contact_dairy_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ContactController contactProvider = Provider.of<ContactController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Contact Diary'),
        actions: [
          IconButton(
            onPressed: () async {
              LocalAuthentication authentication = LocalAuthentication();
              bool opened = await authentication.authenticate(
                  localizedReason: "Open Intro");
              if (opened) {
                Navigator.of(context).pushNamed(
                  AppRoutes.hidePage,
                );
              }
            },
            icon: const Icon(Icons.lock_outlined),
          ),
        ],
      ),
      body: contactProvider.contacts.isEmpty
          ? const Center(child: Text('No contacts yet'))
          : ListView.separated(
              itemCount: contactProvider.contacts.length,
              itemBuilder: (context, index) {
                Contact contact = contactProvider.contacts[index];

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
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.detailsPage, arguments: contact);
                      contactProvider.selectedIndex = index;
                    },
                    onLongPress: () {
                      Navigator.of(context).pushNamed(AppRoutes.counterPage);
                    },
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
                      onPressed: () async {
                        Uri call = Uri(scheme: 'tel', path: contact.number);
                        await launchUrl(call);
                      },
                      icon: const Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
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
