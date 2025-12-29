import 'package:flutter/cupertino.dart';

import '../core/constants/image_utils.dart';

class DashboardProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
  String? _appbarTitle;

  String? get appbarTitle => _appbarTitle;
  void setAppBarTitle(String? value) {
    _appbarTitle = value;
    notifyListeners();
  }
  List<Map<String, dynamic>> topList = [
    {"title": "Haircut", "icon": icTopList1},
    {"title": "Beard", "icon": icTopList2},
    {"title": "Hair color", "icon": icTopList3},
    {"title": " Facial", "icon": icTopList4},
  ];

  List<Map<String, dynamic>> topSpecialistsList = [
    {
      "name": "Robert Fox",
      "icon": icMen,
      "time": "Available till 9:45 am ",
      "status": true,
    },
    {
      "name": "Jacob Jones",
      "icon": icMen,
      "time": "Available till 9:45 am ",
      "status": false,
    },
  ];

  List<Map<String, dynamic>> galleryList = [
    {"title": "Haircut", "icon": icIntro1},
    {"title": "Beard", "icon": icIntro1},
    {"title": "Hair color", "icon": icIntro1},
    {"title": " Facial", "icon": icIntro1},
  ];


  List<Map<String, dynamic>> customerReviewList = [
    {
      "name": "Marvin McKinney",
      "icon": icMen,
      "desc": "The place was spotless, the service was excellent, and the staff were incredibly friendly. I’ll definitely recommend it to my friends and look forward to visiting again! 😊",
      "time": "8:15 am",
      "rating": 4,
    },
    {
      "name": "Jacob Jones",
      "icon": icMen,
      "desc": "The place was very clean, the service was outstanding, and the staff were warm and welcoming. I’ll surely recommend it to my friends and plan to visit again.",
      "time": "2 hr ago",
      "rating": 5,
    },
  ];

}
