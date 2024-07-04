import 'package:flutter/material.dart';
import 'package:round3/controller/Services/driver_service.dart';
import 'package:round3/model/driver_list_model.dart';

class DriverProvider with ChangeNotifier {
  final DriverService _driverService = DriverService();
  List<Driver>? _driverList;
  bool _isLoading = false;

  List<Driver>? get driverList => _driverList;

  bool get isLoading => _isLoading;

  DriverProvider() {
    fetchDriverList();
  }

  Future<void> fetchDriverList() async {
    _isLoading = true;
    notifyListeners();

    _driverList = await _driverService.fetchDriverList();

    _isLoading = false;
    notifyListeners();

    //DELETE

    Future<void> deleteDriver(String driverId) async {
      _isLoading = true;
      notifyListeners();

      bool success = await _driverService.deleteDriver(driverId);

      if (success) {
        _driverList?.removeWhere((driver) => driver.id == driverId);
      }

      _isLoading = false;
      notifyListeners();
    }
  }
}
