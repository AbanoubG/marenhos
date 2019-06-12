class Hymn {
  String title, english, ar, coptic, tag;

  Hymn({
    this.title,
    this.tag,
    this.english,
    this.ar,
    this.coptic,
  });
  Hymn.fromJson(Map<String, dynamic> json) {
    title = json[TITLE];
    tag = json[TAG];
    english = json[ENGLISH];
    ar = json[AR_E];
    coptic = json[COPTIC];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[TITLE] = this.title;
    data[TAG] = this.tag;
    data[ENGLISH] = this.english;
    data[AR_E] = this.ar;
    data[COPTIC] = this.coptic;
    return data;
  }

  static const TITLE = "title";
  static const TAG = "tag";
  static const ENGLISH = "english";
  static const AR_E = "ar-e";
  static const COPTIC = "coptic";
}
