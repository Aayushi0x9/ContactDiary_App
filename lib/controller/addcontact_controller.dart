import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:flutter/cupertino.dart';

class AddcontactController extends ChangeNotifier {
  String? path;

  final List<Contact> _contacts = [
    Contact(
      sdname: 'aayushi',
      ftname: 'nikhare',
      number: '1234567890',
      email: 'aayu@gmail.com',
      company: 'Google',
    ),
  ];
  List<Contact> get contacts => _contacts;

  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void deleteContac(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }

  void updateContact(Contact contact) {
    _contacts[selectedIndex] = contact;
    notifyListeners();
  }
}
