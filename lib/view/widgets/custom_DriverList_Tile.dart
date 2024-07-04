import 'package:flutter/material.dart';
import 'package:round3/model/driver_list_model.dart';

class DriverTile extends StatelessWidget {
  final Driver driver;
  const DriverTile({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 3,
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        leading: SizedBox(
          height: double.infinity,
          child: Image.asset('assets/driver.png'),
        ),
        title: Text(
          driver.name.toString(),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        subtitle: Text(
          driver.licenseNo.toString(),
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
        trailing: GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(8)),
            child: const Center(
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
