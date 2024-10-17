class Contact {
  String ftname;
  String? sdname;
  String number;
  String? email;
  String? company;
  String? imagePath;

  Contact({
    this.sdname,
    required this.ftname,
    required this.number,
    this.email,
    this.company,
    this.imagePath,
  });
}
