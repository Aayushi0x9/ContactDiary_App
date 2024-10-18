import 'dart:io';

import 'package:contact_dairy_app/controller/addContact_controller.dart';
import 'package:contact_dairy_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HideScreen extends StatefulWidget {
  const HideScreen({super.key});

  @override
  State<HideScreen> createState() => _HideScreenState();
}

class _HideScreenState extends State<HideScreen> {
  @override
  Widget build(BuildContext context) {
    AddContactController hideController =
        Provider.of<AddContactController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hide Contacts'),
      ),
      body: (hideController.hideList.isNotEmpty)
          ? ListView.separated(
              itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.detailsPage,
                        arguments: hideController.hideList[index]);
                  },
                  leading: hideController.hideList[index].imagePath == null
                      ? CircleAvatar(
                          child: Text(hideController.hideList[index].ftname[0]),
                        )
                      : CircleAvatar(
                          foregroundImage: FileImage(
                              File(hideController.hideList[index].imagePath!)),
                        ),
                  title: Text(hideController.hideList[index].ftname),
                  subtitle: Text(hideController.hideList[index].number),
                  trailing: IconButton(
                    onPressed: () {
                      hideController
                          .unHideContact(hideController.hideList[index]);
                    },
                    icon: Icon(Icons.restore_from_trash),
                  )),
              separatorBuilder: (context, index) => Divider(),
              itemCount: hideController.hideList.length)
          : Text('No Hide contact yet.'),
    );
  }
}
