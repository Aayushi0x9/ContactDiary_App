import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';

class ContactController extends ChangeNotifier {
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

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<bool> openLock({required context}) async {
    LocalAuthentication auth = LocalAuthentication();
    bool isBioActivate = await auth.canCheckBiometrics;
    bool isDeviceSupport = await auth.isDeviceSupported();

    if (isDeviceSupport && isBioActivate) {
      List<BiometricType> availableBio = await auth.getAvailableBiometrics();
      if (availableBio.isEmpty) {
        return false;
      } else {
        bool authenticated = await auth.authenticate(
          localizedReason: 'Please authenticate to view contacts',
        );
        return true;
      }
    } else {
      return true;
    }
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
