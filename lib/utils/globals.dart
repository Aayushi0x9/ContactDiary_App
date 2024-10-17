class Globals {
  Globals globals = Globals();
  String? number, name, email, image;

  void reset() {
    number = name = email = image = null;
  }

  void saveData() {
    print('number : $number');
    print('name : $name');
    print('email : $email');
    print('image : $image');
  }
}
