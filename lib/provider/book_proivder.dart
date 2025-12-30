import 'package:flutter/cupertino.dart';
class DateItem {
  final DateTime date;

  DateItem(this.date);

  String get day =>
      ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][date.weekday - 1];

  String get dayNumber => date.day.toString();

  bool get isPast {
    final now = DateTime.now();
    return date.isBefore(DateTime(now.year, now.month, now.day));
  }
}

class BookProvider with ChangeNotifier{
  final List<String> services = [
    "Haircut",
    "Beard",
    "Hair color",
    "Facial",
    "Head massage",
    "Hair style",
    "Pedicure",
    "Hair spa",
    "Manicure",
  ];


  final List<String> selectedServices = [];

  void toggleService(String service) {
    if (selectedServices.contains(service)) {
      selectedServices.remove(service);
    } else {
      selectedServices.add(service);
    }
    notifyListeners();
  }

  // key = list identifier, value = selected item
  final Map<String, String?> _selectedItems = {};

  String? getSelectedItem(String key) => _selectedItems[key];

  void selectItem(String key, String item) {
    _selectedItems[key] = item;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();
  DateTime _currentMonth = DateTime.now();
  List<DateItem> dates = [];

/*
  DateProvider() {

  }
*/
  //generateDates();
  DateTime get selectedDate => _selectedDate;
  DateTime get currentMonth => _currentMonth;

  void generateDates() {
    final firstDay =
    DateTime(_currentMonth.year, _currentMonth.month, 1);
    final totalDays =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;

    dates = List.generate(
      totalDays,
          (index) => DateItem(
        DateTime(_currentMonth.year, _currentMonth.month, index + 1),
      ),
    );

    notifyListeners();
  }

  void changeMonth(int offset) {
    _currentMonth =
        DateTime(_currentMonth.year, _currentMonth.month + offset, 1);
    generateDates();
  }

  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  bool isSelected(DateTime date) {
    return date.year == _selectedDate.year &&
        date.month == _selectedDate.month &&
        date.day == _selectedDate.day;
  }

  int todayIndex() {
    final today = DateTime.now();
    return dates.indexWhere((d) =>
    d.date.year == today.year &&
        d.date.month == today.month &&
        d.date.day == today.day);
  }}