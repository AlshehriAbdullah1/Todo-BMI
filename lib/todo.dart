class To_Do {
  String data = "";
  bool ischecked = false;
  final DateTime date = DateTime.now();
  To_Do({required this.data});
  void check() {
    if (ischecked) {
      ischecked = false;
    } else {
      ischecked = true;
    }
  }

  String getDate() {
    return date.toString();
  }
}
