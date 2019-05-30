class Hymn {
<<<<<<< HEAD
  final String title, english, ar, coptic;
=======
  String title, english, ar, coptic;
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b

  Hymn({
    this.title,
    this.english,
    this.ar,
<<<<<<< HEAD
    this.coptic
  });
=======
    this.coptic,
  });
  Hymn.fromJson(Map<String, dynamic> json) {
    title = json[TITLE];
    english = json[ENGLISH];
    ar = json[AR_E];
    coptic = json[COPTIC];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[TITLE] = this.title;
    data[ENGLISH] = this.english;
    data[AR_E] = this.ar;
    data[COPTIC] = this.coptic;
    return data;
  }
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b

  static const TITLE = "title";
  static const ENGLISH = "english";
  static const AR_E = "ar-e";
<<<<<<< HEAD
  static const COPTIC = "cop";
=======
  static const COPTIC = "coptic";
>>>>>>> f1a885a7393254017dc194d35f106f2c1d5b868b
}
