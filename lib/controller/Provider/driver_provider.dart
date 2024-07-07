import 'package:flutter/material.dart';
import 'package:round3/controller/Services/driver_service.dart';
import 'package:round3/model/driver_list_model.dart';

class DriverProvider with ChangeNotifier {
  final DriverService _driverService = DriverService();
  List<Driver> _driverList = [];
  bool _isLoading = false;

  List<Driver>? get driverList => _driverList;

  bool get isLoading => _isLoading;
  bool? _status;
  bool? get status => _status;

  DriverProvider() {
    fetchDriverList();
  }
  //   Future<List<String>> addDriverDatas() async {
  //   _isLoading = true;
  //   // notifyListeners();
  //   await Future.wait([fetchDriverList(),addDriver(String name, String mobile, String licenseNo) ,]);
  //   _isLoading = false;
  //   // notifyListeners();
  // }

  Future<void> fetchDriverList() async {
    _isLoading = true;
    notifyListeners();

    _driverList = await _driverService.fetchDriverList() ?? [];

    _isLoading = false;
    notifyListeners();
  }

  //DELETE

  Future<void> deleteDriver(String driverId) async {
    _isLoading = true;
    notifyListeners();

    bool success = await _driverService.deleteDriver(driverId) ?? false;

    if (success) {
      _driverList?.removeWhere((driver) => driver.id == driverId);
      notifyListeners();
    }

    _isLoading = false;
    notifyListeners();
  }

  //POST

  Future<void> addDriver(
    String name,
    String mobile,
    String licenseNo,
  ) async {
    _isLoading = true;
    notifyListeners();

    bool? result = await _driverService.postDriver(name, mobile, licenseNo);
    if (result == true) {
      print('ResponseResult$result');
      await fetchDriverList();
    }

    _status = result;

    _isLoading = false;
    notifyListeners();
  }
}
