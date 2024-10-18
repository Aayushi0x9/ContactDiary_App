import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:flutter/cupertino.dart';

class AddContactController extends ChangeNotifier {
  final List<Contact> _contacts = [
    Contact(
      ftname: 'asajfnckj',
      number: '25646466',
      email: 'asjfnckj',
    ),
  ];
  List<Contact> get contacts => _contacts;
  List<Contact> hideList = [];

  int selectedIndex = 0;

  // void setPath(int index) {
  //   path = _contacts[index].imagePath;
  //   notifyListeners();
  // }

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void removeContact(Contact contact) {
    _contacts.remove(contact);
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

  void hideContact(Contact contact) {
    hideList.add(contact);
    _contacts.removeAt(selectedIndex);
    notifyListeners();
  }

  void unHideContact(Contact contact) {
    hideList.remove(contact);
    _contacts.add(contact);
    notifyListeners();
  }
}
