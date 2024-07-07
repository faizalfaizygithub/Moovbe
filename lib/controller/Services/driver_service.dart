import 'dart:convert';

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

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var driverList = driverModelFromJson(response.body);
      return driverList.drivers;
    } else {
      print('Failed to load bus list: ${response.reasonPhrase}');
      return null;
    }
  }

  //drivers DELETE

  Future<bool?> deleteDriver(String id) async {
    final response = await http.delete(
        Uri.parse(
          '$_baseUrl/DriverApi',
        ),
        headers: _headers,
        body: {'driver_id': id});

    if (response.statusCode == 200) {
      print('ResponsePrinted:${response.body}');
      final json = jsonDecode(response.body);
      return json['status'];
    } else {
      print('Failed to delete driver: ${response.reasonPhrase}');
    }
    return null;
  }

  Future<bool?> postDriver(
      String name, String mobile, String license_no) async {
    try {
      var headers = {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxODA2NzQ1MTI3LCJpYXQiOjE3MjAzNDUxMjcsImp0aSI6ImRkODM2MDljNzc0YzQyNTVhYmZiOTdmMjYxMGY0MDQyIiwidXNlcl9pZCI6Mn0.pWYdItwtYmrcQnaxtYC6Qh4gIzP2pmlUjimH64xR0TQ',
        'Cookie':
            'csrftoken=R1eYO7lsJ8J3il8y1z2yPqs2AU2UZ9od; sessionid=foiprbp9lmntscepfmn31v5anjc0drny'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://flutter-api.noviindus.in/api/DriverApi'));
      request.fields
          .addAll({'name': name, 'mobile': mobile, 'license_no': license_no});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();

        print(await response.stream.bytesToString());
        DriverModel driverModel = driverModelFromJson(responseBody);

        return driverModel.status;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
