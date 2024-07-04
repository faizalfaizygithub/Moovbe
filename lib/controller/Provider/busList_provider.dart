import 'package:flutter/material.dart';
import 'package:round3/controller/Services/busList_service.dart';
import 'package:round3/model/busList_model.dart';

class HomeProvider with ChangeNotifier {
  final HomeService _homeRepository = HomeService();
  List<BusElement>? _busList;
  bool _isLoading = false;

  List<BusElement>? get busList => _busList;

  bool get isLoading => _isLoading;

  HomeProvider() {
    fetchBusList();
  }

  Future<void> fetchBusList() async {
    _isLoading = true;
    notifyListeners();

    _busList = await _homeRepository.fetchBusList();

    _isLoading = false;
    notifyListeners();
  }
}
