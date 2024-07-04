import 'package:http/http.dart' as http;
import 'package:round3/model/driver_list_model.dart';
import 'package:round3/view/widgets/secrets.dart';

class DriverService {
  final String _baseUrl = 'https://flutter-api.noviindus.in/api/';
  final Map<String, String> _headers = {
    'API-Key': Secrets.token,
    'Authorization': 'Bearer ${Secrets.apiKey}',
    'Cookie':
        'csrftoken=IEcmVmBl9oCg1T8IGIKqPintyslbFnf4; sessionid=4b2dokpwbkuhx75suz91xh3u24ueqtlz'
  };

  Future<List<Driver>?> fetchDriverList() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/DriverApi'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      var driverList = driverModelFromJson(response.body);
      return driverList.drivers;
    } else {
      print('Failed to load bus list: ${response.reasonPhrase}');
      return null;
    }
  }

  //drivers DELETE

  Future<bool> deleteDriver(String driverId) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/DriverApi/$driverId'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Failed to delete driver: ${response.reasonPhrase}');
      return false;
    }
  }
}
