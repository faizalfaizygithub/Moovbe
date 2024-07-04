import 'package:flutter/material.dart';
import 'package:round3/model/busList_model.dart';
import 'package:round3/view/Pages/bus_details_page.dart';

class CustomTile extends StatelessWidget {
  final BusElement busList;
  const CustomTile({super.key, required this.busList});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 3,
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        leading: SizedBox(
          height: double.infinity,
          child: Image.network(
            'https://flutter-api.noviindus.in/${busList.image}',
          ),
        ),
        title: Text(
          busList.name.toString(),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        subtitle: Text(
          busList.id.toString(),
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
        trailing: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BusDetails(
                        driverName: busList.driverName.toString(),
                        drivingLicence: busList.driverLicenseNo.toString(),
                        isTwoIntoTwo: false)));
          },
          child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(8)),
            child: const Center(
              child: Text(
                'Manage',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
