class Menu {
  late int? id;
  late String title;
  Menu(this.id, this.title);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
    };
    return map;
  }

  Menu.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
  }
}
